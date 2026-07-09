-- =========================
-- Plugins
-- =========================
vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",

	"https://github.com/hrsh7th/nvim-cmp",
	"https://github.com/hrsh7th/cmp-nvim-lsp",
	"https://github.com/hrsh7th/cmp-buffer",
	"https://github.com/hrsh7th/cmp-path",

	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/saadparwaiz1/cmp_luasnip",
	"https://github.com/rafamadriz/friendly-snippets",
})
-- =========================
-- Snippets
-- =========================
require("luasnip.loaders.from_vscode").lazy_load()

-- =========================
-- CMP Setup (VSCode-like)
-- =========================
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),

		["<CR>"] = cmp.mapping.confirm({
			select = true,
		}),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),

	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},

	completion = {
		autocomplete = { "TextChanged" }, -- 👈 VSCode-style auto popup
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})

-- =========================
-- LSP Capabilities
-- =========================
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", {
	capabilities = capabilities,
})

-- =========================
-- LSP Servers
-- =========================
vim.lsp.enable({
	"clangd",
	"jdtls",
	-- "pyright",
	"rust_analyzer",
	"lua_ls",
	"zls",
	"marksman",
})

-- =========================
-- Server configs
-- =========================
vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--completion-style=detailed",
		"--header-insertion=iwyu",
	},
	filetypes = { "c", "cpp", "h", "hpp" },
})

vim.lsp.config("jdtls", {
	filetypes = { "java" },
})

vim.lsp.config("pyright", {
	filetypes = { "python" },
})

vim.lsp.config("rust_analyzer", {
	filetypes = { "rust" },
})

vim.lsp.config("zls", {
	filetypes = { "zig" },
})

vim.lsp.config("marksman", {
	filetypes = { "markdown" },
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})

-- =========================
-- Completion UI
-- =========================
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.o.pumheight = 8
vim.o.pumblend = 10

-- =========================
-- LSP Attach
-- =========================
local lsp_group = vim.api.nvim_create_augroup("LspAttachConfig", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = lsp_group,

	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if not client then
			return
		end

		local bufnr = ev.buf

		-- Keymaps
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, {
				buffer = bufnr,
				silent = true,
				desc = desc,
			})
		end

		map("n", "gd", vim.lsp.buf.definition, "Go to definition")
		map("n", "gr", vim.lsp.buf.references, "References")
		map("n", "K", vim.lsp.buf.hover, "Hover")
		map("n", "gi", vim.lsp.buf.implementation, "Implementation")

		map("n", "gl", function()
			vim.diagnostic.open_float(nil, { focus = false })
		end, "Diagnostics")

		map("n", "[d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, "Prev diagnostic")

		map("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, "Next diagnostic")

		-- Format on save
		if client:supports_method("textDocument/formatting") then
			local fmt = vim.api.nvim_create_augroup("LspFormat." .. bufnr, { clear = true })

			vim.api.nvim_create_autocmd("BufWritePre", {
				group = fmt,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						id = client.id,
						timeout_ms = 2000,
					})
				end,
			})
		end
	end,
})

-- =========================
-- Diagnostics
-- =========================
vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	severity_sort = true,
	update_in_insert = false,
	float = {
		border = "rounded",
		source = "always",
	},
})
