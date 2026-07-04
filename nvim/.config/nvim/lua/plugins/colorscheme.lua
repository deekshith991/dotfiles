return {
	{
		"yorumicolors/yorumi.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("yorumi")
		end,
	},
	{
		"Yazeed1s/minimal.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("minimal")
		end,
	},
}
