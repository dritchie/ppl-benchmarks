import subprocess
import os
from datetime import datetime

def doTest(name, cmd):
	print "Running test " + name + "..."
	d1 = datetime.now()
	subprocess.call(cmd)
	d2 = datetime.now()
	return name, d2 - d1

def report(nameAndTime):
	print "Time for {0}: {1}".format(nameAndTime[0], nameAndTime[1].total_seconds())

def run():

	cwd = os.getcwd()
	
	pyTime = doTest("Python", ["python", "{0}/tests/test.py".format(cwd)])
	jsTime = doTest("Javascript", ["node", "{0}/tests/test.js".format(cwd)])
	luaTime = doTest("Lua", ["luajit", "{0}/tests/test.lua".format(cwd)])
	mitTime = doTest("MIT-Church", ["ikarus", "{0}/tests/test.ss".format(cwd)])
	bherTime1 = doTest("Bher (full)", ["bher", "{0}/tests/test.church".format(cwd)])
	bherTime2 = doTest("Bher (pretransformed)", ["vicare", "--r6rs-script", "{0}/tests/test.church.pretransformed.ss".format(cwd)])

	report(pyTime)
	report(jsTime)
	report(luaTime)
	report(mitTime)
	report(bherTime1)
	report(bherTime2)

if __name__ == "__main__":
	run()