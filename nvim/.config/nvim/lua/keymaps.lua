-- =========================================================
-- Neovim Keymaps
-- Cleaned, merged, deduplicated, and documented
-- =========================================================

-- ---------------------------------------------------------
-- Leader Key
-- ---------------------------------------------------------
vim.g.mapleader = " "

-- ---------------------------------------------------------
-- Disable default Escape behavior globally
-- Prevent accidental mode exits
-- ---------------------------------------------------------
vim.keymap.set(
    { "n", "i", "v", "x", "s", "o", "c", "t" },
    "<Esc>",
    "<Nop>"
)

-- ---------------------------------------------------------
-- Better Escape Alternatives
-- ---------------------------------------------------------

-- Ctrl+C acts like Escape in insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Fast escape using jk
vim.keymap.set("i", "jk", "<Esc>")

-- ---------------------------------------------------------
-- Search & Highlighting
-- ---------------------------------------------------------

-- Clear search highlights
vim.keymap.set(
    "n",
    "<C-c>",
    "<cmd>nohlsearch<CR>",
    { desc = "Clear search highlighting", silent = true }
)

-- Keep cursor centered while navigating search results
vim.keymap.set(
    "n",
    "n",
    "nzzzv",
    { desc = "Next search result centered" }
)

vim.keymap.set(
    "n",
    "N",
    "Nzzzv",
    { desc = "Previous search result centered" }
)

-- ---------------------------------------------------------
-- Better Scrolling
-- Keeps cursor centered while moving
-- ---------------------------------------------------------
vim.keymap.set(
    "n",
    "<C-d>",
    "<C-d>zz",
    { desc = "Scroll down and center cursor" }
)

vim.keymap.set(
    "n",
    "<C-u>",
    "<C-u>zz",
    { desc = "Scroll up and center cursor" }
)

-- ---------------------------------------------------------
-- Editing Improvements
-- ---------------------------------------------------------

-- Paste over selection without overwriting yank register
vim.keymap.set(
    "x",
    "p",
    [["_dP]],
    { desc = "Paste without losing yanked text" }
)

-- Delete without copying into registers
vim.keymap.set(
    { "n", "v" },
    "<leader>d",
    [["_d]],
    { desc = "Delete without yanking" }
)

-- Join lines without moving cursor
vim.keymap.set(
    "n",
    "J",
    "mzJ`z",
    { desc = "Join lines without moving cursor" }
)

-- Move selected lines down
vim.keymap.set(
    "v",
    "J",
    ":m '>+1<CR>gv=gv",
    { desc = "Move selected lines down" }
)

-- Move selected lines up
vim.keymap.set(
    "v",
    "K",
    ":m '<-2<CR>gv=gv",
    { desc = "Move selected lines up" }
)

-- Keep selection after indenting
vim.keymap.set(
    "v",
    "<",
    "<gv",
    { desc = "Unindent and keep selection" }
)

vim.keymap.set(
    "v",
    ">",
    ">gv",
    { desc = "Indent and keep selection" }
)

-- ---------------------------------------------------------
-- Search & Replace
-- ---------------------------------------------------------

-- Replace word under cursor globally
vim.keymap.set(
    "n",
    "<leader>s",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word under cursor globally" }
)

-- ---------------------------------------------------------
-- File Operations
-- ---------------------------------------------------------

-- Save file
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", {
    desc = "Save file",
})

vim.keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>a", {
    desc = "Save file",
})

-- Make current file executable
vim.keymap.set(
    "n",
    "<leader>X",
    "<cmd>!chmod +x %<CR>",
    { silent = true, desc = "Make current file executable" }
)

-- Reload / restart config
vim.keymap.set(
    "n",
    "<leader>re",
    "<cmd>restart<CR>",
    { desc = "Restart Neovim config" }
)

-- ---------------------------------------------------------
-- Undo Tree
-- ---------------------------------------------------------

-- Native UndoTree toggle
vim.keymap.set("n", "<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, {
    desc = "Toggle UndoTree",
})

-- =========================================================
-- End of Keymaps
-- =========================================================
