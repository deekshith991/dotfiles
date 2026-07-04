-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false

-- Scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Mouse
vim.opt.mouse = "a"

-- Split behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Undo
vim.opt.undofile = true

-- Performance
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Tabs
vim.opt.showtabline = 2

-- Better completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Don't create swap files
vim.opt.swapfile = false
vim.opt.backup = false

-- Keep indentation when wrapping
vim.opt.breakindent = true

-- Always show the status line
vim.opt.laststatus = 3

-- show invisible chars
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "•",
  space = "·",
  nbsp = "␣",
  extends = "❯",
  precedes = "❮",
}

