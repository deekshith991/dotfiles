vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
})

-- Disable netrw (recommended)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-web-devicons").setup()

require("oil").setup({
	default_file_explorer = true,

	columns = {
		"icon",
		-- "permissions",
		-- "size",
		-- "mtime",
	},

	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,

	view_options = {
		show_hidden = true,
	},

	float = {
		padding = 10,
		border = "rounded",
	},

	keymaps = {
		["<CR>"] = "actions.select",
		["-"] = "actions.parent",
		["_"] = "actions.open_cwd",
		["g."] = "actions.toggle_hidden",
		["gx"] = "actions.open_external",
		["q"] = "actions.close",
		["?"] = "actions.show_help",
	},
})

-- Open Oil in current directory
vim.keymap.set("n", "-", "<CMD>Oil<CR>", {
	desc = "Open parent directory",
})

-- Floating Oil
vim.keymap.set("n", "<leader>e", function()
	require("oil").toggle_float()
end, {
	desc = "Oil float",
})

vim.keymap.set("n", "<leader>-", function()
	vim.cmd("vsplit")
	vim.cmd("wincmd L")
	vim.cmd("vertical resize 30")
	require("oil").open()
end, {
	desc = "Open Oil in right sidebar",
})
