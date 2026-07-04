return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			opts.options = {
				theme = "auto",
				globalstatus = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			}

			opts.sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{
						"filename",
						path = 0, -- 0=name, 1=relative, 2=absolute
					},
				},
				lualine_x = {
					{
						"diff",
						colored = true,
						symbols = {
							added = "+",
							modified = "~",
							removed = "-",
						},
					},
					"diagnostics",
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			}

			return opts
		end,
	},
}
