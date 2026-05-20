
-- This will disable Default FileExplorer Banner
vim.g.netrw_banner = 0

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab settings
vim.opt.tabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


vim.opt.wrap = true
vim.opt.smartindent = true

-- When we try to use command line find 
-- this creates a split window for all matches 
-- try: :%s/word
vim.opt.inccommand = "split"
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- splitting order is set here
vim.opt.splitbelow = true
vim.opt.splitright = true


-- backup
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = vim.fn.stdpath("data").."/undodir"
vim.optundofile = true

-- clipboard
vim.opt.clipboard:append("unnamedplus")

-- disable cursor
-- Handove to terminal
-- vim.opt.guicursor = ""

--scroll spacing
vim.opt.scrolloff = 8

-- shows signs beside the numbers
vim.opt.signcolumn = "yes"

-- hides command line when not used
vim.o.cmdheight = 0

-- colorscheme
vim.opt.termguicolors = true

-- Yank highlighting
vim.api.nvim_create_autocmd("TextYankPost",{
    desc = "HighLight the Yank",
    callback = function()
        vim.hl.on_yank()
    end,
})


-- Enable mouse everywhere except insert mode
vim.o.mouse = "a"

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.o.mouse = ""
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.o.mouse = "a"
  end,
})
