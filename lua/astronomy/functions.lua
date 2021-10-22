-- Author        : swytch
-- Created       : Friday Oct. 22, 2021 22:04:40 CET
-- License       : GPLv3
-- Description   : top-level functions file


local M = {}
local utils = require("astronomy.utils")
local variants = require("astronomy.colors").variants
local g = vim.g

--- Returns the position of the variant that will be loaded.
--@param v_tab table: table of variants
--@parma pos number: a position to search in the table of variants
--@return position number: a valid position for setting a variant from the variant table
local function change_variant(v_tab, pos)
        if next(v_tab) == nil then return end
        return table.getn(v_tab) > pos and pos + 1 or 1
end

---Set a especific variant
--@param scheme string: name of the variant to be set
function M.set_variant(scheme)
        local variant = scheme  or ""
        utils.setup_scheme { variant = variant }
end

--- Sets a variant in accordance with a valid position in the variants table
--@param position number: position to load a variant from the variant table
local function load_variant(position)
        local variant = variants[position]
        g.astronomy_variant_loaded = position
        M.set_variant(variant)
        vim.api.nvim_command(string.format("echo \"[astronomy] colorscheme changed to '%s'\"", variant))
end

--- Set a variant by scrolling through the variant table in an orderly fashion
function M.toggle_variant()
        local position = change_variant(
                variants, g.astronomy_variant_loaded
        )
        load_variant(position)
end

return M
