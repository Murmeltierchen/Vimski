vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.g.background = "dark"

vim.opt.autoread = true
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.scrolloff = 10
vim.opt.laststatus = 3

vim.keymap.set("i", "<C-H>", "<C-w>")
vim.keymap.set("i", "<C-BS>", "<C-w>")
vim.keymap.set("i", "<C-Delete>", '<C-o>"_dw')
vim.keymap.set("n", "<C-S-Up>", ":m -2<CR>")
vim.keymap.set("n", "<C-S-Down>", ":m +1<CR>")
vim.keymap.set("i", "<S-Tab>", "<C-d>")
vim.keymap.set("i", "<C-Tab>", "<C-t>")

vim.keymap.set({ "n", "v" }, "<C-Up>", "10k")
vim.keymap.set({ "n", "v" }, "<C-Down>", "10j")
vim.keymap.set("n", "<S-Up>", ":wincmd k<CR>")
vim.keymap.set("n", "<S-Down>", ":wincmd j<CR>")
vim.keymap.set("n", "<S-Left>", ":wincmd h<CR>")
vim.keymap.set("n", "<S-Right>", ":wincmd l<CR>")

vim.keymap.set("n", "<C-enter>", ":Themery<CR>")
vim.keymap.set("n", "<C-b>", ":TransparentToggle<CR>")

vim.keymap.set("n", "<C-#>", ":TermSelect<CR>")
vim.keymap.set("n", "<C-r>", ":ToggleTermSetName<CR>")
vim.keymap.set("n", "<C-1>", ":ToggleTerm 1 name='Terminal 1'<CR>")
vim.keymap.set("n", "<C-2>", ":ToggleTerm 2 name='Terminal 2'<CR>")
vim.keymap.set("n", "<C-3>", ":ToggleTerm 3 name='Terminal 3'<CR>")
vim.keymap.set("n", "<C-4>", ":ToggleTerm 4 name='Terminal 4'<CR>")
vim.keymap.set("n", "<C-5>", ":ToggleTerm 5 name='Terminal 5'<CR>")
vim.keymap.set("n", "<C-6>", ":ToggleTerm 6 name='Terminal 6'<CR>")
vim.keymap.set("n", "<C-7>", ":ToggleTerm 7 name='Terminal 7'<CR>")
vim.keymap.set("n", "<C-8>", ":ToggleTerm 8 name='Terminal 8'<CR>")
vim.keymap.set("n", "<C-9>", ":ToggleTerm 9 name='Terminal 9'<CR>")
vim.keymap.set("n", "<C-0>", ":ToggleTerm 10 name='Terminal 10'<CR>")

vim.keymap.set("n", "<C-S-d>", ":DiffviewOpen<CR>")
vim.keymap.set("n", "<C-S-h>", ":DiffviewFileHistory<CR>")
vim.keymap.set("n", "<C-S-f>", ":DiffviewFileHistory %<CR>")
vim.keymap.set("n", "<Esc>", ":DiffviewClose<CR>")

vim.keymap.set({ "n", "i", "v" }, "<C-,>", ":CodeCompanionCLI<CR>")
vim.keymap.set({ "n", "i", "v" }, "<C-a>", function()
	return require("codecompanion").cli("#{this}", { focus = false })
end)

vim.keymap.set("n", "<F5>", ":checktime<CR>")

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })

vim.keymap.set("n", "<leader>s", ":nohlsearch<CR>")
