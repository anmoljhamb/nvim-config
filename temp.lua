local var = require("lua.heyitsanmolj.plugins.ui.formatting")

function contains(tbl, val)
	for _, v in ipairs(tbl) do
		if v == val then
			return true
		end
	end
	return false
end

function list_extend(t1, t2)
	local result = {}
	for _, v in ipairs(t1) do
		table.insert(result, v)
	end
	for _, v in ipairs(t2) do
		table.insert(result, v)
	end
	return result
end

local dict = var.opts.formatters_by_ft

local formatters = {}

for key, value in pairs(dict) do
	for i = 1, #value do
		if not contains(formatters, value[i]) then
			table.insert(formatters, value[i])
		end
	end
end

local sample = { "hello" }

local result = list_extend(formatters, sample)

for i = 1, #result do
	print(i, result[i])
end
