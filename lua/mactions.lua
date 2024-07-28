local M = {}

local get_reference = function(line)
	local spaces = ""

	for i = 1, #line, 1 do
		if line:sub(i, i) == "#" and i ~= 1 then
			spaces = spaces .. "\t"
		end
	end

	local title = line:sub(#spaces + 3, -1)
	local reference = spaces .. "- [" .. title .. "](#" .. string.gsub(string.lower(title), " ", "-") .. ")"

	return reference
end

M.generate_toc = function()
	local buf = 0
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
	local num_lines = #lines
	local toc = {}

	for i = 1, num_lines, 1 do
		if lines[i]:sub(1, 1) == "#" then
			local reference = get_reference(lines[i])
			table.insert(toc, reference)
		end
	end

	if #toc > 0 then
		vim.api.nvim_buf_set_lines(buf, 0, 0, false, { "# TOC" })
		vim.api.nvim_buf_set_lines(buf, 1, 1, false, { "" })
		vim.api.nvim_buf_set_lines(buf, 2, #toc + 2, false, toc)
		vim.api.nvim_buf_set_lines(buf, #toc + 3, -1, false, lines)
	end
end

M.toggle_item_list = function()
	local window = 0
	local buf = 0
	local cursor_position = vim.api.nvim_win_get_cursor(window)
	local current_line = vim.api.nvim_buf_get_lines(buf, cursor_position[1] - 1, cursor_position[1], false)

	if string.find(current_line[1], "%[%s*%]") then
		local check_item = string.gsub(current_line[1], "%[%s*%]", "[x]")
		vim.api.nvim_buf_set_lines(buf, cursor_position[1] - 1, cursor_position[1], false, { check_item })
	elseif string.find(current_line[1], "%[x%]") then
		local uncheck_item = string.gsub(current_line[1], "%[x%]", "[ ]")
		vim.api.nvim_buf_set_lines(buf, cursor_position[1] - 1, cursor_position[1], false, { uncheck_item })
	end
end

return M
