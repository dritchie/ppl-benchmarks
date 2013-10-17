import subprocess
from datetime import datetime


def runTest(name, command):
	d1 = datetime.now()
	subprocess.check_output(command)
	d2 = datetime.now()
	print "{0}: {1}".format(name, (d2-d1).total_seconds())


runTest("Medical Diagnosis Bayes Net", ["bher", "medical.church"])