return {
    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        opts = {},
    },

    {
        "echasnovski/mini.icons",
        lazy = true,
        opts = {},
    },
    {
        "echasnovski/mini.ai",
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        opts = function()
            local ai = require("mini.ai")

            return {
                n_lines = 500,

                custom_textobjects = {
                    -- Code blocks
                    o = ai.gen_spec.treesitter({
                        a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                        i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                    }),

                    -- Functions
                    f = ai.gen_spec.treesitter({
                        a = "@function.outer",
                        i = "@function.inner",
                    }),

                    -- Classes
                    c = ai.gen_spec.treesitter({
                        a = "@class.outer",
                        i = "@class.inner",
                    }),

                    -- Function calls
                    u = ai.gen_spec.function_call(),

                    -- Function calls (without dot in name)
                    U = ai.gen_spec.function_call({
                        name_pattern = "[%w_]",
                    }),

                    -- HTML/XML tags
                    t = {
                        "<([%p%w]-)%f[^<%w][^<>]->.-</%1>",
                        "^<.->().*()</[^/]->$",
                    },

                    -- Digits
                    d = { "%f[%d]%d+" },
                },
            }
        end,
    },
}
