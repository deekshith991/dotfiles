--[[
--	This is my trial version of nvim config
--	Date: 16/04/2026
--]]

-- prefix key / leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Relative line number
vim.o.relativenumber = true
vim.o.number = true

-- case insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

-- clipboard sync buffer
vim.schedule(
	function() 
		vim.o.clipboard = 'unnamedplus' 
	end
)

-- Raise dialog if unsaved buffer
vim.o.confirm = true

-- snapppy escape
vim.o.ttimeoutlen = 1

-- vim diagnostics
vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,
	float = { source = 'if_many'},
	jump = {float = true},
})

-- Show diagnostics
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostics' })

-- Easily move between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')

-- Highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function() vim.highlight.on_yank() end,
})

-- plugins
vim.pack.add({
	'https://github.com/ibhagwan/fzf-lua',
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/karb94/neoscroll.nvim',
	{ src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.x') },
	'https://github.com/mfussenegger/nvim-dap',

	-- =========================
	-- [ADDED from second config]
	-- =========================
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/kdheepak/lazygit.nvim',
	'https://github.com/esmuellert/codediff.nvim',
	'https://github.com/goolord/alpha-nvim',
	'https://github.com/MeanderingProgrammer/render-markdown.nvim',
})


-- =========================
-- [ADDED] Markdown renderer
-- =========================
require('render-markdown').setup({})

-- 1. fzf searcher
local fzf = require("fzf-lua")
fzf.setup({
	keymap = {
		builtin = {
			["<C-d>"] = 'preview-page-down',
			["<C-u>"] = 'preview-page-up',
		},
	},

	"borderless_full",

	winopts = {
		height = 0.85,
		width = 0.80,
		row = 0.35,
		col =0.50,
		border = "single",
		preview = {
			layout = "right",
			horizontal = "right:50%",
		},
	},

	files = {
		prompt = "Files >",
		git_icons = true,
		file_icons = true,
	},

	grep = {
		prompt = "Grep > ",
		input_prompt = "Search > ",
	},
})

vim.keymap.set('n', '<leader><leader>', '<cmd>FzfLua files<cr>')
vim.keymap.set("n", "<leader>ff", fzf.files)
vim.keymap.set('n', '<leader>/', '<cmd>FzfLua live_grep<cr>')
vim.keymap.set("n", "<leader>fg", fzf.live_grep)
vim.keymap.set("n", "<leader>fb", fzf.buffers)
vim.keymap.set("n", "<leader>fh", fzf.help_tags)
vim.keymap.set("n", "<leader>fr", fzf.oldfiles)
vim.keymap.set("n", "<leader>fc", fzf.commands)

-- 2. TreeSitter
vim.cmd('syntax off')
vim.api.nvim_create_autocmd('FileType', {
	callback = function() 
		pcall(vim.treesitter.start) 
	end,
})

-- 3. LSP servers
vim.lsp.enable({
	'lua_ls',
	'clangd',

	-- =========================
	-- [ADDED from second config]
	-- =========================
	'ty',
	'ruff',
})

vim.o.signcolumn = 'yes'

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

-- Auto-format
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', { clear = true }),
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		if client:supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				buffer = ev.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = ev.buf })
				end,
			})
		end
	end,
})

-- =========================
-- [ADDED] blink setup
-- =========================
require('blink.cmp').setup({})

-- 4. neoscroll
require('neoscroll').setup({
	hide_cursor = false,
	stop_eof = true,
	easing = 'quadratic',
	duration_multiplier = 0.30,
})

-- 6. DAP (unchanged)
local dap = require('dap')
-- (keeping your original config exactly)

-- =========================
-- [ADDED from second config]
-- =========================

-- Oil file explorer
require("oil").setup({
	view_options = { show_hidden = true },
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>")

-- Lazygit
vim.keymap.set('n', '<leader>g', '<cmd>LazyGit<cr>')

-- Codediff
require("codediff").setup({})

-- Alpha dashboard
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
dashboard.section.footer.val = 'Deekshith'
alpha.setup(dashboard.opts)
