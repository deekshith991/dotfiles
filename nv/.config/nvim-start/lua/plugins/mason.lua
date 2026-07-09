vim.pack.add({
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/williamboman/mason-lspconfig.nvim" },
})

require("mason").setup({
	ui = {
		border = "rounded",
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		-- C / C++
		"clangd",

		-- Java
		"jdtls",

		-- Python
		-- "pyright",

		-- Rust
		"rust_analyzer",

		-- Lua (Neovim config)
		"lua_ls",

		-- Zig
		"zls",

		-- Markdown
		"marksman",
	},

	automatic_installation = true,
})
