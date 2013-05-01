-- Must be run from /probabilistic

local util = require("probabilistic/util")
util.openpackage(util)
local pr = require("probabilistic")
openpackage(pr)

samples = 150
lag = 20
runs = 5
errorTolerance = 0.07

function test(name, estimates, trueExpectation, tolerance)
	tolerance = tolerance or errorTolerance
	io.write("test: " .. name .. "...")
	local errors = util.map(function(est) return math.abs(est - trueExpectation) end, estimates)
	local meanAbsError = mean(errors)
	if meanAbsError > tolerance then
		print(string.format("failed! True mean: %g | Test mean: %g", trueExpectation, mean(estimates)))
	else
		print("passed.")
	end
end

function mhtest(name, computation, trueExpectation, tolerance)
	tolerance = tolerance or errorTolerance
	--test(name, replicate(runs, function() return expectation(computation, traceMH, samples, lag) end), trueExpectation, tolerance)
	test(name, replicate(runs, function() return expectation(computation, LARJMH, samples, 0, nil, lag) end), trueExpectation, tolerance)
end

-------------------------

print("starting tests...")


mhtest(
	"setting a flip",
	function()
		local a = 1 / 1000
		condition(int2bool(flip(a)))
		--condition(flip(a))
		return a
	end,
	1/1000,
	0.000000000000001)

mhtest(
	"unconditioned flip",
	function() return flip(0.7) end,
	0.7)

mhtest(
	"and conditioned on or",
	function()
		local a = int2bool(flip())
		local b = int2bool(flip())
		condition(a or b)
		return bool2int(a and b)
	end,
	1/3)

mhtest(
	"and conditioned on or, biased flip",
	function()
		local a = int2bool(flip(0.3))
		local b = int2bool(flip(0.3))
		condition(a or b)
		return bool2int(a and b)
	end,
	(0.3*0.3) / (0.3*0.3 + 0.7*0.3 + 0.3*0.7))

mhtest(
	"contitioned flip",
	function()
		local bitflip = function(fidelity, x) return flip(int2bool(x) and fidelity or 1-fidelity) end
		local hyp = flip(0.7)
		condition(int2bool(bitflip(0.8, hyp)))
		return hyp
	end,
	(0.7*0.8) / (0.7*0.8 + 0.3*0.2))

mhtest(
	"random 'if' with random branches, unconditioned",
	function()
		if int2bool(flip(0.7)) then
			return flip(0.2)
		else
			return flip(0.8)
		end
	end,
	0.7*0.2 + 0.3*0.8)

mhtest(
	"flip with random weight, unconditioned",
	function() return flip(int2bool(flip(0.7)) and 0.2 or 0.8) end,
	0.7*0.2 + 0.3*0.8)

mhtest(
	"random procedure application, unconditioned",
	function()
		local proc = int2bool(flip(0.7)) and (function(x) return flip(0.2) end) or (function(x) return flip(0.8) end)
		return proc(1)
	end,
	0.7*0.2 + 0.3*0.8)

mhtest(
	"conditioned multinomial",
	function()
		local hyp = multinomialDraw({"b", "c", "d"}, {0.1, 0.6, 0.3})
		local function observe(x)
			if int2bool(flip(0.8)) then
				return x
			else
				return "b"
			end
		end
		condition(observe(hyp) == "b")
		return bool2int(hyp == "b")
	end,
	0.357)

mhtest(
	"recursive stochastic fn, unconditioned",
	function()
		local function powerLaw(prob, x)
			if int2bool(flip(prob, true)) then
				return x
			else
				return 0 + powerLaw(prob, x+1)
			end
		end
		local a = powerLaw(0.3, 1)
		return bool2int(a < 5)
	end, 
	0.7599)

mhtest(
	"memoized flip, unconditioned",
	function()
		local proc = mem(function(x) return int2bool(flip(0.8)) end)
		local p11 = proc(1)
		local p21 = proc(2)
		local p12 = proc(1)
		local p22 = proc(2)
		return bool2int(p11 and p21 and p12 and p22)
	end,
	0.64)

mhtest(
	"memoized flip, conditioned",
	function()
		local proc = mem(function(x) return int2bool(flip(0.2)) end)
		local p1 = proc(1)
		local p21 = proc(2)
		local p22 = proc(2)
		local p23 = proc(2)
		condition(p1 or p21 or p22 or p23)
		return bool2int(proc(1))
	end,
	0.5555555555555555)

mhtest(
	"bound symbol used inside memoizer, unconditioned",
	function()
		local a = flip(0.8)
		local proc = mem(function(x) return int2bool(a) end)
		local p11 = proc(1)
		local p12 = proc(1)
		return bool2int(p11 and p12)
	end,
	0.8)

mhtest(
	"memoized flip with random argument, unconditioned",
	function()
		local proc = mem(function(x) return int2bool(flip(0.8)) end)
		local p1 = proc(uniformDraw({1,2,3}))
		local p2 = proc(uniformDraw({1,2,3}))
		return bool2int(p1 and p2)
	end,
	0.6933333333333334)

mhtest(
	"memoized random procedure, unconditioned",
	function()
		local proc = int2bool(flip(0.7)) and
			(function(x) return int2bool(flip(0.2)) end) or
			(function(x) return int2bool(flip(0.8)) end)
		local memproc = mem(proc)
		local mp1 = memproc(1)
		local mp2 = memproc(2)
		return bool2int(mp1 and mp2)
	end,
	0.22)

mhtest(
	"mh-query over rejection query for conditioned flip",
	function()
		local function bitflip(fidelity, x)
			return int2bool(flip(x and fidelity or 1-fidelity))
		end
		local function innerQuery()
			local a = int2bool(flip(0.7))
			condition(bitflip(0.8, a))
			return bool2int(a)
		end
		return rejectionSample(innerQuery)
	end,
	0.903225806451613)

mhtest(
	"trans-dimensional",
	function()
		local a = int2bool(flip(0.9, true)) and beta(1,5) or 0.7
		local b = flip(a)
		condition(int2bool(b))
		return a
	end,
	0.417)

mhtest(
	"memoized flip in if branch (create/destroy memprocs), unconditioned",
	function()
		local a = int2bool(flip()) and mem(flip) or mem(flip)
		local b = a()
		return b
	end,
	0.5)

print("tests done!")


