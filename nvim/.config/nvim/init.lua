-- =========================================================
--                  MAIN NEOVIM CONFIG
-- =========================================================
--
-- Entry point for Neovim configuration.
--
-- This file is responsible for:
--   • Enabling experimental UI features
--   • Setting global editor behavior
--   • Loading modular configuration files
--
-- File: init.lua
--
-- =========================================================



-- =========================================================
--                    UI2 ENABLE
-- =========================================================
--
-- Enables Neovim's experimental UI2 system.
--
-- Benefits:
--   • Better command-line behavior
--   • Improved UI rendering
--   • Access to bottom command buffer using:
--
--         g<
--
-- NOTE:
-- This is an internal Neovim feature and may change
-- in future versions.
--
require("vim._core.ui2").enable({})



-- =========================================================
--                    GLOBAL STATUSLINE
-- =========================================================
--
-- Use a single shared statusline across all windows.
--
-- Values:
--   0 -> Never show statusline
--   1 -> Show only if multiple windows
--   2 -> Show for every window
--   3 -> Single global statusline
--
-- Recommended for cleaner modern UI.
--
vim.opt.laststatus = 3



-- =========================================================
--                    LOAD CONFIG MODULES
-- =========================================================
--
-- Modular configuration structure:
--
-- lua/
-- ├── options.lua
-- ├── keymaps.lua
-- ├── plugins.lua
-- └── ...
--
-- require("options")
-- loads:
--   lua/options.lua
--
require("options")
require("keymaps")


-- =========================================================
--                        END FILE
-- =========================================================
