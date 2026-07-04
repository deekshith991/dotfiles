vim.o.cmdheight = 0

require("vim._core.ui2").enable({
  msg = {
    targets = {
      default = "msg",
      search_cmd = "cmd",
      search_count = "cmd",
      progress = "msg",
    },
  },
})


require("config.lazy")
require("config.options")
require("config.keymaps")
