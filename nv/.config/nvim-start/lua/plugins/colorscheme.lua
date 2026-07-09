vim.pack.add({
	"https://github.com/folke/tokyonight.nvim",
})

vim.cmd.colorscheme("D_cov1-pre")
-- vim.cmd.colorscheme("tokyonight-night")

-- local default_theme = "D_cov1"
-- local markdown_theme = "tokyonight"
--
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "markdown",
-- 	callback = function()
-- 		vim.cmd.colorscheme(markdown_theme)
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
-- 	callback = function(args)
-- 		if vim.bo[args.buf].filetype ~= "markdown" then
-- 			vim.cmd.colorscheme(default_theme)
-- 		end
-- 	end,
-- })
