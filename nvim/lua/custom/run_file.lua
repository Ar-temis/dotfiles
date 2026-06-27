local M = {}

local term_buf = nil
local term_win = nil
local term_job = nil

local function build_command()
	local ft = vim.bo.filetype
	local file = vim.fn.expand("%")
	local root = vim.fn.expand("%:r")

	if ft == "python" then
		return { "python3", file }
	elseif ft == "javascript" then
		return { "node", file }
	elseif ft == "lua" then
		return { "lua", file }
	elseif ft == "sh" then
		return { "bash", file }
	elseif ft == "c" then
		return { "bash", "-c", "gcc " .. file .. " -o /tmp/a.out && /tmp/a.out" }
	elseif ft == "cpp" then
		return { "bash", "-c", "g++ " .. file .. " -o /tmp/a.out && /tmp/a.out" }
	elseif ft == "java" then
		return { "bash", "-c", "javac " .. file .. " && java " .. root }
	end
end

function M.run()
	vim.cmd("write")

	local cmd = build_command()
	if not cmd then
		print("No run command for filetype: " .. vim.bo.filetype)
		return
	end

	-- kill previous process if running
	if term_job then
		pcall(vim.fn.jobstop, term_job)
	end

	-- create terminal if it doesn't exist
	if not (term_buf and vim.api.nvim_buf_is_valid(term_buf)) then
		vim.cmd("split")
		term_win = vim.api.nvim_get_current_win()
		term_buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_win_set_buf(term_win, term_buf)
	else
		-- reopen window if closed
		if not (term_win and vim.api.nvim_win_is_valid(term_win)) then
			vim.cmd("split")
			term_win = vim.api.nvim_get_current_win()
			vim.api.nvim_win_set_buf(term_win, term_buf)
		else
			vim.api.nvim_set_current_win(term_win)
		end
	end

	term_job = vim.fn.termopen(cmd)
	vim.cmd("startinsert")
end

return M
