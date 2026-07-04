return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				-- Lua
				lua = { "stylua" },

				-- Web
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "prettier" },

				scss = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				markdown = { "prettier" },
				yaml = { "prettier" },
				toml = { "taplo" },

				-- Python / Go / Ruby / PHP
				python = { "black" },
				go = { "gofmt" },
				ruby = { "rubocop" },
				php = { "php_cs_fixer" },

				-- C / C++
				c = { "clang_format" },
				cpp = { "clang_format" },

				-- Rust
				rust = { "rustfmt" },

				-- Java / JVM
				java = { "google-java-format" },
				kotlin = { "ktlint" },

				-- Shell
				sh = { "shfmt" },
				bash = { "shfmt" },
				zsh = { "shfmt" },

				-- DevOps / Infra
				dockerfile = { "dockfmt" },
				terraform = { "terraform_fmt" },

				-- SQL
				sql = { "sqlfluff" },

				-- Org mode
				org = { "prettier" },
			},

			format_on_save = {
				timeout_ms = 2000,
				lsp_fallback = true,
			},

			formatters = {
				prettier = {
					prepend_args = { "--tab-width", "2" },
				},

				clang_format = {
					prepend_args = function(self, ctx)
						-- check for .clang-format in project root
						local has_clang_format = vim.fs.find(".clang-format", { upward = true, path = ctx.dirname })[1]

						if has_clang_format then
							-- use project config file
							return {}
						end

						-- fallback style if no file exists
						return {
							"--style=LLVM", -- replace LLVM with your "XX" style if needed
						}
					end,
				},
				rustfmt = {},

				["google-java-format"] = {
					prepend_args = { "--aosp" },
				},

				shfmt = {
					prepend_args = { "-i", "2" },
				},

				sqlfluff = {
					prepend_args = { "format", "--dialect", "ansi" },
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000,
			})
		end, { desc = "Format file" })
	end,
}
