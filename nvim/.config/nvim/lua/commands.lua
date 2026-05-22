-- User commands for vim.pack
-- :PackAdd    user/repo
-- :PackDel    plugin-name
-- :PackUpdate [plugin-name ...]

vim.api.nvim_create_user_command("PackAdd", function(opts)
    vim.pack.add(opts.fargs)
end, {
    nargs = "+",
    desc = "Install one or more plugins",
})

-- PackDel / PackUpdate are built-in in Neovim 0.13+
vim.api.nvim_create_user_command("PackDel", function(opts)
    vim.pack.del(opts.fargs)
end, {
    nargs = "+",
    desc = "Remove one or more plugins",
})

vim.api.nvim_create_user_command("PackUpdate", function(opts)
    -- Update specific plugins if args are provided
    if opts.args:match("%S") then
        local plugins = vim.split(opts.args, "%s+", {
            trimempty = true,
        })

        vim.pack.update(plugins)
        return
    end
    -- Otherwise update everything
    vim.pack.update()
end, {
    nargs = "*",
    desc = "Update all plugins or selected ones",
})
