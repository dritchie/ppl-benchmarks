------------------
-- NOTE: Run this after checking out quicksand branch "withoutAD"
--    and probabilistic-js branch "crossBrowser"
-------------------


local util = terralib.require("util")

local function getLineCount(filename)
	return tonumber(util.wait(string.format("wc %s", filename)):split(" ")[1])
end

local function getJSFileLineCount(filename)
	util.wait(string.format("python decomment.py %s decomment_tmp cpp", filename))
	local lc = getLineCount("decomment_tmp")
	util.wait("rm -f decomment_tmp")
	return lc
end

local function getTerraFileLineCount(filename)
	util.wait(string.format("python decomment.py %s decomment_tmp lua", filename))
	local lc = getLineCount("decomment_tmp")
	util.wait("rm -f decomment_tmp")
	return lc
end

local jsFilenames = 
{
	"erp.js",
	"index.js",
	"inference.js",
	"memoize.js",
	"trace.js",
	"transform.js"
}

local terraFilenames = 
{
	"erph.t",
	"erp.t",
	"inference.t",
	"init.t",
	"larj.t",
	"memoize.t",
	"random.t",
	"specialize.t",
	"trace.t"
}

local jsLineCount = 0
for _,filename in ipairs(jsFilenames) do
	local fullfilename = string.format("../../probabilistic-js/probabilistic/%s", filename)
	jsLineCount = jsLineCount + getJSFileLineCount(fullfilename)
end

local terraLineCount = 0
for _,filename in ipairs(terraFilenames) do
	local fullfilename = string.format("../../quicksand/prob/%s", filename)
	terraLineCount = terraLineCount + getTerraFileLineCount(fullfilename)
end

print(string.format("PJS line count: %u", jsLineCount))
print(string.format("Quicksand line count: %u", terraLineCount))


