local M = {}

M.generate_toc = function()
	local bufnr = vim.api.nvim_get_current_buf() -- Number of the current buffer
	local line_count = vim.api.nvim_buf_line_count(bufnr)
	local contents = vim.api.nvim_buf_get_lines(bufnr, 0, line_count, false)

	for i = 1, line_count do
		print(contents[i])
	end
end

M.generate_toc()

return M
