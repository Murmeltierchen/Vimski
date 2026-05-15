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
