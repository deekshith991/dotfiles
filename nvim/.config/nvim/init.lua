-- ================
-- Main Nvim config
-- ================

-- Enable UI2 
-- This will enable the option to go into bottom buffer of the nvim with 
-- the command "g<"
require("vim._core.ui2").enable({})
-- One line command line for all
vim.opt.laststatus = 3


-- Load Lua module
-- require("Module filename")
require("options")
