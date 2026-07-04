return {
	{
		"akinsho/bufferline.nvim",
		opts = function(_, opts)
			opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
				-- General
				mode = "buffers", -- "buffers" | "tabs"
				always_show_bufferline = true,
				themable = true,

				-- Numbers
				numbers = "ordinal", -- "none" | "ordinal" | "buffer_id" | function

				-- Icons
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = false,

				-- Diagnostics
				diagnostics = "nvim_lsp", -- false | "nvim_lsp"
				diagnostics_indicator = function(count)
					return " " .. count
				end,

				-- Separators
				separator_style = "slant", -- "slant" | "slope" | "thin" | "thick"

				-- Indicator
				indicator = {
					style = "icon", -- "icon" | "underline"
				},

				-- Buffer Names
				max_name_length = 24,
				max_prefix_length = 18,
				truncate_names = true,

				-- Sorting
				persist_buffer_sort = true,
				move_wraps_at_ends = true,
				sort_by = "insert_after_current",
				-- "insert_after_current" | "insert_at_end" | "directory"
				-- "relative_directory" | "tabs"

				-- Hover
				hover = {
					enabled = true,
					delay = 150,
					reveal = { "close" },
				},

				-- Neo-tree Offset
				offsets = {
					{
						filetype = "neo-tree",
						text = "󰙅 Explorer",
						highlight = "Directory",
						text_align = "left",
						separator = true,
					},
				},

				-- Filter
				custom_filter = function(bufnr)
					return vim.bo[bufnr].buftype ~= "terminal"
					-- return true -- show terminal buffers
				end,

				-- Mouse
				left_mouse_command = "buffer %d",
				middle_mouse_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
			})
		end,

		keys = {
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous Buffer" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },

			{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin Buffer" },
			{ "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Delete Non-Pinned Buffers" },

			{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete Other Buffers" },
			{ "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Delete Buffers to the Right" },
			{ "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Delete Buffers to the Left" },

			{ "<A-,>", "<cmd>BufferLineMovePrev<cr>", desc = "Move Buffer Left" },
			{ "<A-.>", "<cmd>BufferLineMoveNext<cr>", desc = "Move Buffer Right" },
			--
			-- { "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Buffer 1" },
			-- { "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Buffer 2" },
			-- { "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Buffer 3" },
			-- { "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Buffer 4" },
			-- { "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Buffer 5" },
			-- { "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Buffer 6" },
			-- { "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Buffer 7" },
			-- { "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Buffer 8" },
			-- { "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Buffer 9" },
		},
	},
}
