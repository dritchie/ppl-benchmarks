local util = terralib.require("util")

-- Just invoke all the files for each language
print("Terra\n------------")
print(util.wait("terra examples.t"))
print("Javascript\n------------")
print(util.wait("node ../../probabilistic-js/bin/p.js examples.pjs"))
