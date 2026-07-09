-- ~/.config/nvim/colors/D_cov1.lua

vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "D_cov1-pre"

local set = vim.api.nvim_set_hl

Base_bg_color = "#161616"
Black_color = "#000000"

-- Basic UI
set(0, "Normal", { fg = "#f7f7f7", bg = Base_bg_color })
set(0, "NonText", { fg = "#ffff00", bg = "#000000" })
set(0, "CursorLine", { bg = "#374700" })

set(0, "LineNr", { fg = "#6c7086" })                    -- normal line numbers
set(0, "CursorLineNr", { fg = "#fd613a", bold = true }) -- active line number

set(0, "SignColumn", { bg = Base_bg_color })
set(0, "StatusLine", { fg = "#000000", bg = "#ffffff", bold = true })
set(0, "StatusLineNC", { fg = "#808080", bg = "#ffffff", bold = true })
set(0, "Directory", { fg = "#a680ff" })
set(0, "Visual", { bg = "#7ba800" })
set(0, "Search", { fg = "#f7f7f7", bg = "#6d6a9a" })
set(0, "CurSearch", { fg = "#000000", bg = "#6cfe43" })
set(0, "IncSearch", { fg = "#000000", bg = "#6cfe43" })
set(0, "MatchParen", { fg = "#f7f7f7", bg = "#6d6a9a" })
set(0, "Pmenu", { fg = "#ffffff", bg = "#8d5435" })
set(0, "PmenuSel", { fg = "#f7f7f7", bg = "#e9892f", bold = true })
set(0, "PmenuSbar", { fg = "#4e3da4", bg = "#6e6e6e" })
set(0, "VertSplit", { fg = "#ffffff" })
set(0, "WinSeparator", { fg = "#ffffff" }) -- modern replacement
set(0, "MoreMsg", { fg = "#feecec" })
set(0, "Question", { fg = "#feecec" })
set(0, "Title", { fg = "#ffffff" })

-- Syntax
set(0, "Comment", { fg = "#7c7c7c", italic = true })
set(0, "Constant", { fg = "#92e561" })
set(0, "Identifier", { fg = "#79fcd6" })
set(0, "Statement", { fg = "#ff8800" })
set(0, "PreProc", { fg = "#654A96" })
set(0, "Type", { fg = "#AE81FF" })
set(0, "Special", { fg = "#f47da4" })

-- Refined syntax
set(0, "String", { fg = "#34fe5c" })
set(0, "Number", { fg = "#34cb5c" })
set(0, "Boolean", { fg = "#34ae5c" })
set(0, "Function", { fg = "#21e4f2", italic = true })
set(0, "Keyword", { fg = "#cc008b", italic = true })

-- Treesitter HTML
set(0, "@tag", { fg = "#ffffff" })
set(0, "@tag.delimiter", { fg = "#feecec" })
set(0, "@tag.attribute", { fg = "#21e4f2" })

-- Messages & diagnostics
set(0, "ErrorMsg", { fg = "#ff0000" })
set(0, "Error", { fg = "#ff0000" })

set(0, "DiagnosticError", { fg = "#ff0000" })
set(0, "DiagnosticWarn", { fg = "#ffcc00" })
set(0, "DiagnosticInfo", { fg = "#2a38fe" })
set(0, "DiagnosticHint", { fg = "#00ffff" })
set(0, "DiagnosticOk", { fg = "#00ff00" })

set(0, "DiagnosticVirtualTextError", {
	fg = "#ff0000",
	bg = "#1a0000",
})

set(0, "DiagnosticVirtualTextWarn", {
	fg = "#ffcc00",
	bg = "#1a1400",
})

set(0, "DiagnosticVirtualTextInfo", {
	fg = "#2a38fe",
	bg = "#040619",
})

set(0, "DiagnosticVirtualTextHint", {
	fg = "#00ffff",
	bg = "#001a1a",
})

-- Plugin highlights
set(0, "CopilotSuggestion", { fg = "#7c7c7c" })
set(0, "TelescopeSelection", { bg = "#7ba800" })
