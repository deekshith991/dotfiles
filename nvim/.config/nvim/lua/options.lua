-- =========================================================
--                    Neovim Options
-- =========================================================
-- This file contains all general Neovim settings:
--   • UI / Appearance
--   • Indentation
--   • Search behavior
--   • Splits
--   • Clipboard
--   • Undo / Backup
--   • Mouse settings
--   • Autocommands
--
-- File: lua/config/options.lua
-- =========================================================



-- =========================================================
--                    NETRW SETTINGS
-- =========================================================

-- Disable the default banner shown by netrw
-- (the built-in file explorer)
vim.g.netrw_banner = 0



-- =========================================================
--                    LINE NUMBERS
-- =========================================================

-- Show absolute line number on current line
vim.opt.number = true

-- Show relative numbers for easier movement
-- Example:
--   5j   -> move 5 lines down
--   3k   -> move 3 lines up
vim.opt.relativenumber = true



-- =========================================================
--                    TAB & INDENTATION
-- =========================================================

-- Number of spaces a TAB character counts for
vim.opt.tabstop = 4

-- Number of spaces used for each indentation level
vim.opt.shiftwidth = 4

-- Convert tabs into spaces
vim.opt.expandtab = true

-- Automatically indent new lines
vim.opt.smartindent = true



-- =========================================================
--                    TEXT WRAPPING
-- =========================================================

-- Wrap long lines instead of extending horizontally
vim.opt.wrap = true



-- =========================================================
--                    SEARCH SETTINGS
-- =========================================================

-- Ignore case while searching
-- Example:
--   searching "hello" matches:
--   Hello, HELLO, hello
vim.opt.ignorecase = true

-- Override ignorecase if search contains uppercase letters
-- Example:
--   searching "Hello" only matches "Hello"
vim.opt.smartcase = true

-- Live preview of substitutions
-- Example:
--   :%s/old/new/g
--
-- Opens a split window showing changes in real-time
vim.opt.inccommand = "split"



-- =========================================================
--                    WINDOW SPLITS
-- =========================================================

-- Open horizontal splits below current window
vim.opt.splitbelow = true

-- Open vertical splits to the right
vim.opt.splitright = true



-- =========================================================
--                    BACKUP & UNDO
-- =========================================================

-- Disable backup files
vim.opt.backup = false

-- Disable swap files
vim.opt.swapfile = false

-- Persistent undo:
-- Undo history remains even after closing Neovim
vim.opt.undofile = true

-- Location where undo files are stored
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"



-- =========================================================
--                    CLIPBOARD
-- =========================================================

-- Use system clipboard
-- Allows copy/paste between Neovim and OS
vim.opt.clipboard:append("unnamedplus")



-- =========================================================
--                    SCROLL SETTINGS
-- =========================================================

-- Keep at least 8 lines visible above/below cursor
-- Makes scrolling smoother and easier to track
vim.opt.scrolloff = 8



-- =========================================================
--                    SIGN COLUMN
-- =========================================================

-- Always show sign column
-- Prevents text shifting when diagnostics appear
vim.opt.signcolumn = "yes"



-- =========================================================
--                    COMMAND LINE
-- =========================================================

-- Hide command line when not being used
-- Gives a cleaner UI
vim.o.cmdheight = 0



-- =========================================================
--                    COLORS
-- =========================================================

-- Enable true color support (24-bit RGB colors)
vim.opt.termguicolors = true



-- =========================================================
--                    CURSOR SETTINGS
-- =========================================================

-- Uncomment this if you want terminal cursor style
-- instead of Neovim GUI cursor styling
--
-- vim.opt.guicursor = ""



-- =========================================================
--                    YANK HIGHLIGHTING
-- =========================================================

-- Briefly highlight text after copying (yanking)
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",

    callback = function()
        vim.hl.on_yank()
    end,
})



-- =========================================================
--                    MOUSE SUPPORT
-- =========================================================

-- Enable mouse support in all modes
vim.o.mouse = "a"



-- =========================================================
--              DISABLE MOUSE IN INSERT MODE
-- =========================================================
-- This makes insert mode feel more terminal-like.
-- Mouse is disabled while typing and re-enabled after.

-- Disable mouse when entering insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
    desc = "Disable mouse in insert mode",

    callback = function()
        vim.o.mouse = ""
    end,
})

-- Re-enable mouse after leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
    desc = "Enable mouse after insert mode",

    callback = function()
        vim.o.mouse = "a"
    end,
})



-- =========================================================
--                        END FILE
-- =========================================================
