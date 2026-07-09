--------------------------------------------------
-- Editor Options
--------------------------------------------------
local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.list = true
opt.listchars = {
	tab = "» ",
	trail = "·",
	nbsp = "␣",
}

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- Clipboard
opt.clipboard = "unnamedplus"

--------------------------------------------------
-- Keymaps
--------------------------------------------------
local map = vim.keymap.set

-- Exit insert mode quickly
map("i", "jk", "<Esc>", {
	desc = "Exit insert mode",
})

-- Clear search highlights
map("n", "<C-c>", "<cmd>nohlsearch<CR>", {
	desc = "Clear search highlight",
})

--------------------------------------------------
-- Move Lines
--------------------------------------------------

-- Normal mode
map("n", "<A-j>", "<cmd>m .+1<CR>==", {
	desc = "Move line down",
})

map("n", "<A-k>", "<cmd>m .-2<CR>==", {
	desc = "Move line up",
})

-- Visual mode
map("v", "<A-j>", ":m '>+1<CR>gv=gv", {
	desc = "Move selection down",
})

map("v", "<A-k>", ":m '<-2<CR>gv=gv", {
	desc = "Move selection up",
})

--------------------------------------------------
-- User Commands
--------------------------------------------------

-- Allow :W as :w
vim.api.nvim_create_user_command("W", "write", {})

--------------------------------------------------
-- Auto Formatting
--------------------------------------------------

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = {
		"*.c",
		"*.h",
		"*.cpp",
		"*.hpp",
	},
	callback = function()
		vim.cmd("%!clang-format")
	end,
})

--------------------------------------------------
-- Auto Pair Examples (Disabled)
--------------------------------------------------

-- map("i", "(", "()<Esc>i")
-- map("i", "[", "[]<Esc>i")
-- map("i", "{", "{}<Esc>i")
-- map("i", "'", "''<Esc>i")
-- map("i", '"', '""<Esc>i'e


-- Better splits
opt.splitbelow = true
opt.splitright = true

-- Keep cursor away from edges
opt.scrolloff = 8

-- Faster updates
opt.updatetime = 250

-- Persistent undo
opt.undofile = true

-- True colors
opt.termguicolors = true

-- Better indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

-- Mouse support
opt.mouse = "a"
