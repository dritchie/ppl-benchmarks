var util = require("probabilistic/util")
util.openModule(util)
var pr = require("probabilistic")
util.openModule(pr)

var samples = 150
var lag = 20
var runs = 5
var errorTolerance = 0.07

function test(name, estimates, trueExpectation, tolerance)
{
	tolerance = (tolerance === undefined ? errorTolerance : tolerance)
	process.stdout.write("test: " + name + "...")
	var errors = estimates.map(function(est) { return Math.abs(est - trueExpectation) })
	var meanAbsError = mean(errors)
	if (meanAbsError > tolerance)
		console.log("failed! True mean: " + trueExpectation + " | Test mean: " + mean(estimates))
	else
		console.log("passed.")
}

function mhtest(name, computation, trueExpectation, tolerance)
{
	tolerance = (tolerance === undefined ? errorTolerance : tolerance)
	//test(name, repeat(runs, function() { return expectation(computation, traceMH, samples, lag) }), trueExpectation, tolerance)
	test(name, repeat(runs, function() { return expectation(computation, LARJMH, samples, 0, undefined, lag) }), trueExpectation, tolerance)
}

///////////////////////////////////////////////////////////////////////////////


console.log("starting tests...")


mhtest(
	"setting a flip",
	prob(function()
	{
		var a = 1/1000
		condition(flip(a))
		return a
	}),
	1/1000,
	0.000000000000001)

mhtest(
	"unconditioned flip",
	prob(function() { return flip(0.7) }),
	0.7)

mhtest(
	"and conditioned on or",
	prob(function()
	{
		var a = flip()
		var b = flip()
		condition(a || b)
		return (a && b)
	}),
	1/3)

mhtest(
	"and conditioned on or, biased flip",
	prob(function()
	{
		var a = flip(0.3)
		var b = flip(0.3)
		condition(a || b)
		return (a && b)
	}),
	(0.3*0.3) / (0.3*0.3 + 0.7*0.3 + 0.3*0.7))

mhtest(
	"contitioned flip",
	prob(function()
	{
		var bitflip = prob(function (fidelity, x)
		{
			return flip(x ? fidelity : 1-fidelity)
		})
		var hyp = flip(0.7)
		condition(bitflip(0.8, hyp))
		return hyp
	}),
	(0.7*0.8) / (0.7*0.8 + 0.3*0.2))

mhtest(
	"random 'if' with random branches, unconditioned",
	prob(function()
	{
		if (flip(0.7))
			return flip(0.2)
		else
			return flip(0.8)
	}),
	0.7*0.2 + 0.3*0.8)

mhtest(
	"flip with random weight, unconditioned",
	prob(function()
	{
		return flip(flip(0.7) ? 0.2 : 0.8)
	}),
	0.7*0.2 + 0.3*0.8)

mhtest(
	"random procedure application, unconditioned",
	prob(function()
	{
		var proc = prob(flip(0.7) ?
			function (x) { return flip(0.2) } :
			function (x) { return flip(0.8) })
		return proc(1)
	}),
	0.7*0.2 + 0.3*0.8)

mhtest(
	"conditioned multinomial",
	prob(function()
	{
		var hyp = multinomialDraw(['b', 'c', 'd'], [0.1, 0.6, 0.3])
		var observe = prob(function (x)
		{
			if (flip(0.8))
				return x
			else
				return 'b'
		})
		condition(observe(hyp) == 'b')
		return (hyp == 'b')
	}),
	0.357)

mhtest(
	"recursive stochastic fn, unconditioned",
	prob(function()
	{
		var powerLaw = prob(function (p, x)
		{
			if (flip(p, true))
				return x
			else
				return 0 + powerLaw(p, x+1)
		})
		var a = powerLaw(0.3, 1)
		return a < 5
	}),
	0.7599)

mhtest(
	"memoized flip, unconditioned",
	prob(function()
	{
		var proc = mem(prob(function (x) { return flip(0.8) }))
		var p11 = proc(1)
		var p21 = proc(2)
		var p12 = proc(1)
		var p22 = proc(2)
		return p11 && p21 && p12 && p22
	}),
	0.64)

mhtest(
	"memoized flip, conditioned",
	prob(function()
	{
		var proc = mem(prob(function (x) { return flip(0.2) }))
		var p11 = proc(1)
		var p21 = proc(2)
		var p22 = proc(2)
		var p23 = proc(2)
		condition(p11 || p21 || p22 || p23)
		return proc(1)
	}),
	0.5555555555555555)

mhtest(
	"bound symbol used inside memoizer, unconditioned",
	prob(function()
	{
		var a = flip(0.8)
		var proc = mem(prob(function (x) { return a }))
		var p11 = proc(1)
		var p12 = proc(1)
		return p11 && p12
	}),
	0.8)

mhtest(
	"memoized flip with random argument, unconditioned",
	prob(function()
	{
		var proc = mem(prob(function (x) { return flip(0.8) }))
		var p1 = proc(uniformDraw([1,2,3]))
		var p2 = proc(uniformDraw([1,2,3]))
		return p1 && p2
	}),
	0.6933333333333334)

mhtest(
	"memoized random procedure, unconditioned",
	prob(function()
	{
		var proc = flip(0.7) ?
					prob(function (x) { return flip(0.2)}) :
					prob(function (x) { return flip(0.8)})
		var memproc = mem(proc)
		var mp1 = memproc(1)
		var mp2 = memproc(2)
		return mp1 && mp2
	}),
	0.22)

mhtest(
	"mh-query over rejection query for conditioned flip",
	prob(function()
	{
		var bitflip = prob(function (fidelity, x)
		{
			return flip(x ? fidelity : 1-fidelity)
		})
		var innerQuery = prob(function()
		{
			var a = flip(0.7)
			condition(bitflip(0.8, a))
			return a
		})
		return rejectionSample(innerQuery)
	}),
	0.903225806451613)

mhtest(
	"trans-dimensional",
	prob(function()
	{
		var a = flip(0.9, true) ? beta(1, 5) : 0.7
		var b = flip(a)
		condition(b)
		return a
	}),
	0.417)

mhtest(
	"memoized flip in if branch (create/destroy memprocs), unconditioned",
	prob(function()
	{
		var a = flip() ? mem(flip) : mem(flip)
		var b = a()
		return b
	}),
	0.5)


console.log("tests done!")

