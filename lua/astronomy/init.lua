--[[
  Title:        astronomy.nvim
  Description:  Simplistic theme for neovim, written in lua
  Author:       swy7ch <swy7ch@protonmail.com>
  Website:      https://github.com/swy7ch/astronomy.git
--]]

local utils = require("astronomy.utils")
local functions = require("astronomy.functions")
local M = {}

-- Setup function to load the colorscheme
--@param opts table: custom options to be applied to the editor
function M.setup(opts)
        utils.setup_scheme(opts)
end

M.toggle_variant        = functions.toggle_variant
M.random_variant        = functions.random_variant
M.set_variant           = functions.set_variant

return M
