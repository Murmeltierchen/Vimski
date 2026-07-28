local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

-----------

local function with_visual_restore(is_visual, action_fn)
	if is_visual then
		local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
		vim.cmd("normal! " .. esc)
	end

	action_fn()

	if is_visual then
		local save_mark = vim.fn.getpos("'z")
		vim.cmd("normal! mz")
		vim.cmd("normal! gv`z")
		vim.fn.setpos("'z", save_mark)
	end
end

local function word_right_stop_eol()
	local mode = vim.api.nvim_get_mode().mode
	local is_visual = mode:match("^[vV\22]")
	local is_insert = mode:sub(1, 1) == "i"

	with_visual_restore(is_visual, function()
		local current_line = vim.fn.line(".")
		local current_col = vim.fn.col(".")
		local line_len = #vim.fn.getline(".")

		local target_col = is_insert and (line_len + 1) or math.max(1, line_len)

		vim.cmd("normal! w")

		if current_col < target_col and vim.fn.line(".") ~= current_line then
			vim.fn.cursor(current_line, target_col)
		end
	end)
end

local function word_left_stop_bol()
	local mode = vim.api.nvim_get_mode().mode
	local is_visual = mode:match("^[vV\22]")
	local is_insert = mode:sub(1, 1) == "i"

	with_visual_restore(is_visual, function()
		local current_line = vim.fn.line(".")
		local current_col = vim.fn.col(".")
		local line_text = vim.fn.getline(".")

		local first_non_blank = line_text:find("%S") or 1

		if current_col <= first_non_blank then
			if current_line > 1 then
				local prev_line = current_line - 1
				local prev_len = #vim.fn.getline(prev_line)
				local target_col = is_insert and (prev_len + 1) or math.max(1, prev_len)
				vim.fn.cursor(prev_line, target_col)
			end
		else
			vim.cmd("normal! b")

			if vim.fn.line(".") ~= current_line then
				vim.fn.cursor(current_line, first_non_blank)
			end
		end
	end)
end

vim.keymap.set({ "n", "i", "x" }, "<C-Right>", word_right_stop_eol, { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "x" }, "<C-Left>", word_left_stop_bol, { noremap = true, silent = true })

-----------

vim.api.nvim_create_autocmd("FileType", {
	callback = function(event)
		local buf = event.buf
		local ft = vim.bo[buf].filetype
		local bt = vim.bo[buf].buftype
		if bt ~= "" and ft ~= "help" then
			return
		end
		local lang = vim.treesitter.language.get_lang(ft) or ft
		local success = pcall(vim.treesitter.start, buf)
		if not success then
			vim.cmd("TSInstall " .. lang)
			local attempts = 0
			local function check_and_activate()
				attempts = attempts + 1
				if not vim.api.nvim_buf_is_valid(buf) then
					return
				end
				local active = pcall(vim.treesitter.start, buf)
				if not active and attempts < 30 then
					vim.defer_fn(check_and_activate, 500)
				end
			end
			vim.defer_fn(check_and_activate, 500)
		end
	end,
})
