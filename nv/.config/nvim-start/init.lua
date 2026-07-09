--------------------------------------------------
-- UI
--------------------------------------------------
require("vim._core.ui2").enable({})

--------------------------------------------------
-- Leader Keys
--------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--------------------------------------------------
-- Keymaps
--------------------------------------------------

-- Restart Neovim
vim.keymap.set("n", "<leader>re", function()
    vim.cmd("restart")
end, {
    desc = "Restart Neovim",
})

-- Toggle native UndoTree
vim.opt.undofile = true
vim.keymap.set("n", "<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, {
    desc = "Toggle UndoTree",
})

--------------------------------------------------
-- Autocommands
--------------------------------------------------

-- Highlight text after yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

--------------------------------------------------
-- Plugin Configuration
--------------------------------------------------

-- Core
require("plugins.colorscheme")
require("plugins.whichKey")
require("plugins.lualine")

-- Navigation & UI
require("plugins.fff")
require("plugins.fileExplorer")
require("plugins.flash")
require("plugins.markdownRender")

-- Editing
require("plugins.autoclose")
require("plugins.Fterm")
require("plugins.commandrunner")

-- Git
require("plugins.Gitsigns")

-- LSP & Tooling
require("plugins.mason")
require("plugins.LSP")

-- Productivity
-- require("plugins.neorg")
require("plugins.workspaces")
require("plugins.tuxedo")

-- Optional
-- require("plugins.commander")

--------------------------------------------------
-- Options
--------------------------------------------------

require("config.options")
