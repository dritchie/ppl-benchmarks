local util = terralib.require("util")

-- Just invoke all the files for each language

-- print("Quicksand\n------------")
-- print(util.wait("terra examples.t"))

-- print("PJS\n------------")
-- print(util.wait("node ../../probabilistic-js/bin/p.js examples.pjs"))

print("Bher\n------------")
print(util.wait("python examples.py"))
