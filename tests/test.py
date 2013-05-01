
from probabilistic import *

samples = 150
lag = 20
runs = 5
errorTolerance = 0.07

def test(name, estimates, trueExpectation, tolerance=errorTolerance):

	print "test: {0} ...".format(name),

	errors = map(lambda estimate: abs(estimate - trueExpectation), estimates)
	meanAbsError = mean(errors)
	if meanAbsError > tolerance:
		print "failed! True mean: {0} | Test mean: {1}".format(trueExpectation, mean(estimates))
	else:
		print "passed."

def mhtest(name, computation, trueExpectation, tolerance=errorTolerance):
	#test(name, repeat(runs, lambda: expectation(computation, traceMH, samples, lag)), trueExpectation, tolerance)
	test(name, repeat(runs, lambda: expectation(computation, LARJMH, samples, 0, None, lag)), trueExpectation, tolerance)


if __name__ == "__main__":

	print "starting tests..."


	def flipSetTest():
		a = 1.0 / 1000
		condition(flip(a))
		return a
	mhtest("setting a flip", \
			flipSetTest, \
			1.0/1000, \
			tolerance=1e-15)


	mhtest("unconditioned flip", \
			lambda: flip(0.7), \
			0.7)


	def andConditionedOnOrTest():
		a = flip()
		b = flip()
		condition(a or b)
		return a and b
	mhtest("and conditioned on or", \
			andConditionedOnOrTest, \
			1.0/3)


	def biasedFlipTest():
		a = flip(0.3)
		b = flip(0.3)
		condition(a or b)
		return a and b
	mhtest("and conditioned on or, biased flip", \
			biasedFlipTest, \
			(0.3*0.3) / (0.3*0.3 + 0.7*0.3 + 0.3*0.7))


	def conditionedFlipTest():
		bitFlip = lambda fidelity, x: flip(fidelity if x else 1 - fidelity)
		hyp = flip(0.7)
		condition(bitFlip(0.8, hyp))
		return hyp
	mhtest("conditioned flip", \
			conditionedFlipTest, \
			(0.7*0.8) / (0.7*0.8 + 0.3*0.2))


	def randomIfBranchTest():
		if (flip(0.7)):
			return flip(0.2)
		else:
			return flip(0.8)
	mhtest("random 'if' with random branches, unconditioned", \
			randomIfBranchTest, \
			0.7*0.2 + 0.3*0.8)


	mhtest("flip with random weight, unconditioned", \
			lambda: flip(0.2 if flip(0.7) else 0.8), \
			0.7*0.2 + 0.3*0.8)


	def randomProcAppTest():
		proc = (lambda x: flip(0.2)) if flip(0.7) else (lambda x: flip(0.8))
		return proc(1)
	mhtest("random procedure application, unconditioned", \
			randomProcAppTest, \
			0.7*0.2 + 0.3*0.8)


	def conditionedMultinomialTest():
		hyp = multinomialDraw(['b', 'c', 'd'], [0.1, 0.6, 0.3])
		def observe(x):
			if flip(0.8):
				return x
			else:
				return 'b'
		condition(observe(hyp) == 'b')
		return hyp == 'b'
	mhtest("conditioned multinomial", \
			conditionedMultinomialTest, \
			0.357)

	def recursiveStochasticTest():
		def powerLaw(prob, x):
			if flip(prob, isStructural=True):
				return x
			else:
				return 0 + powerLaw(prob, x+1)
		a = powerLaw(0.3, 1)
		return a < 5
	mhtest("recursive stochastic fn, unconditioned", \
			recursiveStochasticTest, \
			0.7599)

	def memoizedFlipTest():
		proc = mem(lambda x: flip(0.8))
		return all([proc(1), proc(2), proc(1), proc(2)])
	mhtest("memoized flip, unconditioned", \
			memoizedFlipTest, \
			0.64)


	def memoizedFlipConditionedTest():
		proc = mem(lambda x: flip(0.2))
		condition(any([proc(1), proc(2), proc(2), proc(2)]))
		return proc(1)
	mhtest("memoized flip, conditioned", \
			memoizedFlipConditionedTest, \
			0.5555555555555555)


	def boundSymbolInMemoizerTest():
		a = flip(0.8)
		proc = mem(lambda x: a)
		return all([proc(1), proc(1)])
	mhtest("bound symbol used inside memoizer, unconditioned", \
			boundSymbolInMemoizerTest, \
			0.8)


	def memRandomArgTest():
		proc = mem(lambda x: flip(0.8))
		return all([proc(uniformDraw([1,2,3])), proc(uniformDraw([1,2,3]))])
	mhtest("memoized flip with random argument, unconditioned", \
			memRandomArgTest, \
			0.6933333333333334)


	def memRandomProc():
		proc = (lambda x: flip(0.2)) if flip(0.7) else (lambda x: flip(0.8))
		memproc = mem(proc)
		return all([memproc(1), memproc(2)])
	mhtest("memoized random procedure, unconditioned", \
			memRandomProc, \
			0.22)


	def mhOverRejectionTest():
		def bitFlip(fidelity, x):
			return flip(fidelity if x else (1-fidelity))
		def innerQuery():
			a = flip(0.7)
			condition(bitFlip(0.8, a))
			return a
		return rejectionSample(innerQuery)
	mhtest("mh-query over rejection query for conditioned flip", \
			mhOverRejectionTest, \
			0.903225806451613)


	def transDimensionalTest():
		a = beta(1, 5) if flip(0.9, isStructural=True) else 0.7
		b = flip(a)
		condition(b)
		return a
	mhtest("trans-dimensional", \
			transDimensionalTest, \
			0.417)


	def memFlipInIfTest():
		a = mem(flip) if flip() else mem(flip)
		b = a()
		return b
	mhtest("memoized flip in if branch (create/destroy memprocs), unconditioned", \
			memFlipInIfTest, \
			0.5)


	print "tests done!"

