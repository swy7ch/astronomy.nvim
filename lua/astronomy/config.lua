-- Author        : swytch
-- Created       : Friday Oct. 22, 2021 22:04:40 CET
-- License       : GPLv3
-- Description   : colorscheme config file


local M = {}

-- Default scheme options
M.scheme_options = {
    variant = "blackhole",
    disable = {
        background = false,
        endOfBuffer = true,
    },
    custom_colors = {}
}

-- Set custom options to the editor
--@param opts table: custom options for editor
function M.set_options(opts)
    local options = opts or {}
    if type(options) == "table" then
        local new_sets = vim.tbl_deep_extend(
            "force", {}, M.scheme_options, options
            )
        M.scheme_options = new_sets
    end
end

-- Get the value of secheme options
--@param tab table: custom options to be applied to the editor scheme
--@returns settings table: settings adapted to load the scheme
function M.get_options()
    local settings          = {}
    local opts              = M.scheme_options

    settings.eof            = opts.disable.endOfBuffer
    settings.disable_bg     = opts.disable.background  and "NONE"

    return settings
end

return M
