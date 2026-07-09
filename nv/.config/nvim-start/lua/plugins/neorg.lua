vim.pack.add({
	"https://github.com/nvim-neorg/lua-utils.nvim",
	"https://github.com/nvim-neorg/tree-sitter-norg",
	"https://github.com/nvim-neorg/neorg",
	-- "https://github.com/nvim-neorg/pathlib.nvim",
})
require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {},
		["core.dirman"] = {
			config = {
				workspaces = {
					notes = "~/notes/org/",
				},
				default_workspace = "notes",
			},
		},
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "norg",
	callback = function()
		vim.wo.foldlevel = 99
		vim.wo.conceallevel = 2
	end,
})
