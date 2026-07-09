vim.pack.add({
	{
		src = "https://github.com/marzeq/command-runner.nvim",
		name = "command-runner.nvim",
	}
})

require("command-runner").setup({
	split_height = 25,
	start_insert = false,
	start_at_end = true,
	backend = "native",
	run_next_on_failure = false,
})

vim.keymap.set("n", "<leader>;", "<cmd>CommandRunnerRunArbitrary<CR>")
vim.keymap.set("n", "<leader>c", "<cmd>CommandRunnerRunAll<CR>")
vim.keymap.set("n", "<leader>.", "<cmd>CommandRunnerRun<CR>")
vim.keymap.set("n", "<leader>=", "<cmd>CommandRunnerSet<CR>")
