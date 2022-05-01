-- Author        : swytch
-- Created       : Friday Oct. 22, 2021 22:04:40 CET
-- License       : GPLv3
-- Description   : core-level functions file


local config    = require("astronomy.config")
local theme     = require("astronomy.scheme")
local colors    = require("astronomy.colors")

local api = vim.api
local M = {}

-- Apply colors in the editor
--@param group string: group name
--@param cols string: color name to be applied to the groups
local function set_highlights(group, cols)
    api.nvim_command(string.format('highlight %s gui=%s guifg=%s guibg=%s guisp=%s',
        group,
        cols.style or "NONE",
        cols.fg    or "NONE",
        cols.bg    or "NONE",
        cols.sp    or "NONE"
    ))

    if cols.link then
        api.nvim_command(string.format("highlight! link %s %s", group, cols.link))
    end
end

-- Load colorscheme
--@param scheme table: editor elements with its colors
--@param custom_tab table: custom color table
local function load_colorscheme(scheme, custom_tab)
    local color_table = scheme or {}
    local custom_colors = custom_tab or {}

    -- reset the highlighting
    if vim.fn.exists("sintax_on") then api.nvim_command("syntax reset") end
    vim.opt.background = "dark"
    vim.g.colors_name = "astronomy"
    vim.g.astronomy = 1
    vim.opt.termguicolors = true

    if type(custom_colors) == "table" then
        if next(custom_colors) ~= nil then
            color_table = vim.tbl_deep_extend("force", {}, color_table, custom_colors)
        end
    end

    --Load editor colors
    for grp, col in pairs(color_table) do
        set_highlights(grp, col)
    end
end

-- Set and load the color scheme
--@param opts table: custom options to be applied to the editor
function M.setup_scheme(opts)
    config.set_options(opts)
    local sch_opts = config.scheme_options

    local scheme = colors.set_scheme(sch_opts.variant)
    local colorscheme = theme.load_colors(scheme)

    load_colorscheme(colorscheme, sch_opts.custom_colors)
end

return M
