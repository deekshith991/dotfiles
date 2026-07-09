vim.pack.add({
	{ src = "https://github.com/deekshith991/tuxedo.nvim" }
})

require('tuxedo').setup {
	create_todo_file = false,
	width_ratio = 0.95,
	height_ratio = 0.90,
}

vim.keymap.set("n", "<leader>ot", "<cmd>Tuxedo<cr>", { desc = "Run Tuxedo" })
