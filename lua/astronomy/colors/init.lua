-- Author        : swytch
-- Created       : Friday Oct. 22, 2021 22:04:40 CET
-- License       : GPLv3
-- Description   : variant management file


local colors = {}
        colors.variants = {
                [1] = "blackhole",
                [2] = "pulsar",
}

-- Check for the existence of a variant in the variant table
--@param val string: variant to search for
--@return exists boolean: boolean value with the search response
local function variant_exists(val)
        local variant = val or ""
        local index = vim.fn.index(colors.variants, variant)
        local exists = index >= 0 and true or false
        return exists, (index + 1)
end

-- Select variant color and return it
--@param variant string: name of the selected color variant
--@return scheme table: editor elements with its respective colors
function colors.set_scheme(variant)
        local scheme = {}
        local variant_selected = variant or ""
        local exists, index = variant_exists(variant_selected)

        if exists then
                _, scheme = pcall(require,
                string.format("astronomy.colors.%s", variant_selected))
                vim.g.astronomy_variant_loaded = index
        else
                scheme = require("astronomy.colors.blackhole")
                print(string.format(
                        "[astronomy] the variant '%s' does not exists;",
                        variant_selected),
                        "default variant was set."
                )
                vim.g.astronomy_variant_loaded = 1
        end
        scheme.none = "NONE"

        return scheme
end

return colors
