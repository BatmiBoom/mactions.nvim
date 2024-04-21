local t = require("pl.pretty")

local bufrn = vim.api.nvim_get_current_buf()
local lines = vim.api.nvim_buf_get_lines(bufrn, 0, -1, false)
local num_lines = #lines

local toc = {}

local get_title_and_len = function(line)
	local len = 0

	for i = 1, #line, 1 do
		if line:sub(i, i) == "#" then
			len = len + 1
		end
	end

	local title = line:sub(len + 2, -1)
	local reference = "[" .. title .. "](#" .. title .. ")"

	return { len, reference }
end

for i = 1, num_lines, 1 do
	if lines[i]:sub(1, 1) == "#" then
		local len_and_title = get_title_and_len(lines[i])
		table.insert(toc, len_and_title)
	end
end

t.dump(toc)
