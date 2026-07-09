-- lua/plugins/workspaces.lua

vim.pack.add({
	"https://github.com/TheLazyCat00/workspaces-nvim",
})

require("workspaces-nvim").setup({
	-- Keys to use for pinning
	keys = "1234567890",

	-- <leader>1 -> switch to pinned file
	selectLeaderKey = "<leader>",

	-- <leader>h1 -> pin current file
	pinLeaderKey = "<leader>h",

	-- Clear all pins in current workspace
	clearKey = "<leader>hd",

	-- Highlight colors
	colors = {
		shortcut = "#EA572A",
		currentFile = "#06ADDB",
	},

	-- UI window offset
	offset = {
		x = 0,
		y = 0,
	},
})
