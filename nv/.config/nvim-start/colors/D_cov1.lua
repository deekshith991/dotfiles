-- D_COV1
-- created on https://nvimcolors.com

-- vim.opt.termguicolors = true
-- vim.cmd("colorscheme D_cov1")
-- Put it in your Neovim colorschemes directory (~/.config/nvim/colors/)

-- Clear existing highlights and reset syntax
vim.cmd("highlight clear")
vim.cmd("syntax reset")

-- Basic UI elements
vim.cmd("highlight Normal guibg=#000000 guifg=#f7f7f7")
vim.cmd("highlight NonText guibg=#000000 guifg=#000000")
vim.cmd("highlight CursorLine guibg=#374700")
vim.cmd("highlight LineNr guifg=#ffffff")
vim.cmd("highlight CursorLineNr guifg=#fd613a")
vim.cmd("highlight SignColumn guibg=#000000")
vim.cmd("highlight StatusLine gui=bold guibg=#ffffff guifg=#000000")
vim.cmd("highlight StatusLineNC gui=bold guibg=#ffffff guifg=#808080")
vim.cmd("highlight Directory guifg=#a680ff")
vim.cmd("highlight Visual guibg=#7ba800")
vim.cmd("highlight Search guibg=#6d6a9a guifg=#f7f7f7")
vim.cmd("highlight CurSearch guibg=#6cfe43 guifg=#000000")
vim.cmd("highlight IncSearch gui=None guibg=#6cfe43 guifg=#000000")
vim.cmd("highlight MatchParen guibg=#6d6a9a guifg=#f7f7f7")
vim.cmd("highlight Pmenu guibg=#8d5435 guifg=#f7f7f7")
vim.cmd("highlight PmenuSel guibg=#e9892f guifg=#000000")
vim.cmd("highlight PmenuSbar guibg=#6e6e6e guifg=#4e3da4")
vim.cmd("highlight VertSplit guifg=#ffffff")
vim.cmd("highlight MoreMsg guifg=#feecec")
vim.cmd("highlight Question guifg=#feecec")
vim.cmd("highlight Title guifg=#ffffff")

-- Syntax highlighting
vim.cmd("highlight Comment guifg=#7c7c7c gui=italic")
vim.cmd("highlight Constant guifg=#34fe5c")
vim.cmd("highlight Identifier guifg=#ffffff")
vim.cmd("highlight Statement guifg=#ff8800")
vim.cmd("highlight PreProc guifg=#ff8800")
vim.cmd("highlight Type guifg=#e100ff gui=None")
vim.cmd("highlight Special guifg=#feecec")

-- Refined syntax highlighting
vim.cmd("highlight String guifg=#34fe5c")
vim.cmd("highlight Number guifg=#34fe5c")
vim.cmd("highlight Boolean guifg=#34fe5c")
vim.cmd("highlight Function guifg=#21e4f2")
vim.cmd("highlight Keyword guifg=#cc008b gui=italic")

-- Html syntax highlighting
vim.cmd("highlight Tag guifg=#ffffff")
vim.cmd("highlight @tag.delimiter guifg=#feecec")
vim.cmd("highlight @tag.attribute guifg=#21e4f2")

-- Messages
vim.cmd("highlight ErrorMsg guifg=#ff0000")
vim.cmd("highlight Error guifg=#ff0000")
vim.cmd("highlight DiagnosticError guifg=#ff0000")
vim.cmd("highlight DiagnosticVirtualTextError guibg=#1a0000 guifg=#ff0000")
vim.cmd("highlight WarningMsg guifg=#ffcc00")
vim.cmd("highlight DiagnosticWarn guifg=#ffcc00")
vim.cmd("highlight DiagnosticVirtualTextWarn guibg=#1a1400 guifg=#ffcc00")
vim.cmd("highlight DiagnosticInfo guifg=#2a38fe")
vim.cmd("highlight DiagnosticVirtualTextInfo guibg=#040619 guifg=#2a38fe")
vim.cmd("highlight DiagnosticHint guifg=#00ffff")
vim.cmd("highlight DiagnosticVirtualTextHint guibg=#001a1a guifg=#00ffff")
vim.cmd("highlight DiagnosticOk guifg=#00ff00")

-- Common plugins
vim.cmd("highlight CopilotSuggestion guifg=#7c7c7c") -- Copilot suggestion
vim.cmd("highlight TelescopeSelection guibg=#7ba800") -- Telescope selection
