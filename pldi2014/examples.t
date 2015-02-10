require("prob")
local Vector = require("vector")
local m = require("mem")

local C = terralib.includecstring [[
#include <stdlib.h>
#include <stdio.h>
#include <sys/time.h>
inline void flush() { fflush(stdout); }
double CurrentTimeInSeconds() {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return tv.tv_sec + tv.tv_usec / 1000000.0;
}
]]

------------------------------------

-- One dimensional Ising line of fixed size
local function ising_closed()
	return pfn(terra(numSites: uint, spinPrior: double, affinity: double)
		var sites = [Vector(int)].stackAlloc(numSites, -1)
		for i=0,numSites do
			-- Priors
			if flip(spinPrior, {structural=false}) then
				sites:set(i, 1)
			end
			-- Factors
			for i=0,numSites-1 do
				factor(affinity*sites:get(i)*sites:get(i+1))
			end
			return sites
		end
	end)
end

-- One dimensional Ising line of variable size
local function ising_open()
	local ising = ising_closed()
	return pfn(terra(numPrior: double, spinPrior: double, affinity: double)
		var numSites = poisson(numPrior)
		return ising(numSites, spinPrior, affinity)
	end)
end

------------------------------------

local struct GMM
{
	weights: Vector(double),
	means: Vector(double),
	stddevs: Vector(double)
}

terra GMM:__construct()
	m.init(self.weights)
	m.init(self.means)
	m.init(self.stddevs)
end

terra GMM:__copy(other: &GMM)
	self.weights = m.copy(other.weights)
	self.means = m.copy(other.means)
	self.stddevs = m.copy(other.stddevs)
end

terra GMM:__destruct()
	m.destruct(self.weights)
	m.destruct(self.means)
	m.destruct(self.stddevs)
end

m.addConstructors(GMM)

-- Sample from a mixture of gaussians with known number of components
local function gmm_sample()
	local terra sample(model: &GMM)
		var which = multinomial(model.weights, {structural=false})
		return gaussian(model.means:get(which), model.stddevs:get(which), {structural=false})
	end
	local terra sample_conditioned(model: &GMM, val: double)
		var which = multinomial(model.weights, {structural=false})
		return gaussian(model.means:get(which), model.stddevs:get(which), {structural=false, constrainTo=val})
	end
	sample:adddefinition(sample_conditioned:getdefinitions()[1])
	return pfn(sample)
end

-- Train the parameters of a mixture of gaussians with known number of components
--    using some data
local function gmm_train()
	local gmm = gmm_sample()
	return pfn(terra(meanPriorMean: double, meanPriorSD: double, stddevPriorAlpha: double, stddevPriorBeta: double,
				 weightPriors: &Vector(double), data: &Vector(double))
		var model = GMM.stackAlloc()
		m.destruct(model.weights)
		model.weights = dirichlet(@weightPriors, {structural=false})
		model.means:resize(model.weights.size)
		for i=0,model.means.size do model.means:set(i, gaussian(meanPriorMean, meanPriorSD, {structural=false})) end
		model.stddevs:resize(model.weights.size)
		for i=0,model.stddevs.size do model.stddevs:set(i, 1.0/gamma(stddevPriorAlpha, stddevPriorBeta, {structural=false})) end
		
		for i=0,data.size do
			gmm(&model, data:get(i))
		end

		return model
	end)
end

------------------------------------

local numStates = 9
local numVocabWords = 11

local function hmm()

	local HMM = {}

	HMM.observationModel = memglobal(pfn(terra(state: uint)
		return dirichlet([Vector(double)].stackAlloc(numVocabWords, 1.0))
	end))

	HMM.observation = pfn(terra(state: uint)
		return multinomial(HMM.observationModel(state))
	end)

	HMM.transitionModel = memglobal(pfn(terra(state: uint)
		return dirichlet([Vector(double)].stackAlloc(numStates, 1.0))
	end))

	HMM.transition = pfn(terra(state: uint)
		return multinomial(HMM.transitionModel(state))
	end)

	HMM.sampleWordsFixedn = pfn(terra(n: uint)
		var state = 0U
		var sequence = [Vector(uint)].stackAlloc(n, 0)
		for i=0,n do
			sequence:set(i, HMM.observation(state))
			state = HMM.transition(state)
		end
		return sequence
	end)

	return HMM
end

------------------------------------

-- MCMC
local samples = 5000

-- Ising Examples
local isingNumSites = 1000
local isingNumPrior = 1000
local isingSitePrior = 0.5
local isingAffinity = 2.0

-- GMM Examples
local numDataPoints = 1000
local sourceModel = global(GMM)
local trainingData = global(Vector(double))
local weightPriors = global(Vector(double))
local meanPriorMean = 0.0
local meanPriorSD = 3.0
local stddevPriorAlpha = 2.0
local stddevPriorBeta = 2.0
local sampleGMM = gmm_sample()
local terra setupGMMGlobals()
	sourceModel = GMM.stackAlloc()
	sourceModel.weights:fill(0.1, 0.3, 0.6)
	sourceModel.means:fill(0.0, -5.7, 9.6)
	sourceModel.stddevs:fill(0.5, 1.1, 0.2)
	trainingData = [Vector(double)].stackAlloc(numDataPoints, 0.0)
	for i=0,numDataPoints do
		trainingData:set(i, sampleGMM(&sourceModel))
	end
	weightPriors = Vector.fromItems(0.33, 0.33, 0.33)
end

------------------------------------

local function runTest(name, computation)
	-- Run twice to factor out JIT overhead.
	local terra test()
		var samps = [mcmc(computation, RandomWalk(), {numsamps=samples})]
		m.destruct(samps)
		var t0 = C.CurrentTimeInSeconds()
		samps = [mcmc(computation, RandomWalk(), {numsamps=samples})]
		var t1 = C.CurrentTimeInSeconds()
		m.destruct(samps)
		return t1 - t0
	end
	local time = test()
	print(string.format("%s: %g seconds", name, time))
end

------------------------------------

runTest(
"Ising Line (Closed-Universe)",
function()
	local ising = ising_closed()
	return terra()
		return ising(isingNumSites, isingSitePrior, isingAffinity)
	end
end)

runTest(
"Ising Line (Open-Universe)",
function()
	local ising = ising_open()
	return terra()
		return ising(isingNumPrior, isingSitePrior, isingAffinity)
	end
end)

setupGMMGlobals()
runTest(
"Train GMM",
function()
	local trainGMM = gmm_train()
	return terra()
		return trainGMM(meanPriorMean, meanPriorSD, stddevPriorAlpha, stddevPriorBeta,
						&weightPriors, &trainingData)
	end
end)

-- runTest(
-- "Medical Diagnosis Bayes Net",
-- function()
-- 	return terra()
-- 		var worksInHospital = flip(0.01)
-- 		var smokes = flip(0.2)

-- 		var lungCancer = flip(0.01) or (smokes and flip(0.02))
-- 		var TB = flip(0.005) or (worksInHospital and flip(0.01))
-- 		var cold = flip(0.2) or (worksInHospital and flip(0.25))
-- 		var stomachFlu = flip(0.1)
-- 		var other = flip(0.1)

-- 		var cough = (cold and flip(0.5)) or (lungCancer and flip(0.2)) or (TB and flip(0.7)) or (other and flip(0.01))
-- 		var fever = (cold and flip(0.3)) or (stomachFlu and flip(0.5)) or (TB and flip(0.2)) or (other and flip(0.01))
-- 		var chestPain = (lungCancer and flip(0.4)) or (TB and flip(0.5)) or (other and flip(0.01))
-- 		var shortnessOfBreath = (lungCancer and flip(0.4)) or (TB and flip(0.5)) or (other and flip(0.01))

-- 		condition(cough and chestPain and shortnessOfBreath)

-- 		return array(lungCancer, TB)
-- 	end
-- end)

runTest(
"HMM",
function ()
	local HMM = hmm()
	return terra()
		var sequence = HMM.sampleWordsFixedn(100)
		condition(sequence:get(1) == 2)
		return sequence
	end
end)






