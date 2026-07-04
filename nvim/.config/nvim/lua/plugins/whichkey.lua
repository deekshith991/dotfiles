return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  opts = function(_, opts)
    opts.spec = opts.spec or {}

    vim.list_extend(opts.spec, {
      -- top-level groups
      { "<leader>g", group = "Git" },
      { "<leader>gh", group = "GitHub" },
      { "<leader>N", group = "Notification" },

      { "<leader>n", group = "Neorg" },

      { "<leader>f", group = "Find / File" },
      { "<leader>s", group = "Search" },
      { "<leader>u", group = "UI / Toggles" },
      { "<leader>b", group = "Buffer" },
    })

    return opts
  end,

  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
