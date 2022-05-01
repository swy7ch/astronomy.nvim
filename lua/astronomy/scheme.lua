-- Author        : swytch
-- Created       : Friday Oct. 22, 2021 22:04:40 CET
-- License       : GPLv3
-- Description   : scheme loading file


-- local config = require("astronomy.config")
local M = {}
local g = vim.g

local static = {
        coq_checked             ="#36704f",
        coq_sent                ="#4b4b4b",
}

-- Load terminal colors
--@param tab table: scheme colors to apply
local function terminal_colors(tab)
        g.terminal_color_0      = tab.black
        g.terminal_color_1      = tab.darkred
        g.terminal_color_2      = tab.darkgreen
        g.terminal_color_3      = tab.orange
        g.terminal_color_4      = tab.darkblue
        g.terminal_color_5      = tab.darkmagenta
        g.terminal_color_6      = tab.darkcyan
        g.terminal_color_7      = tab.grey
        g.terminal_color_8      = tab.darkgrey
        g.terminal_color_9      = tab.red
        g.terminal_color_10     = tab.green
        g.terminal_color_11     = tab.yellow
        g.terminal_color_12     = tab.blue
        g.terminal_color_13     = tab.magenta
        g.terminal_color_14     = tab.cyan
        g.terminal_color_15     = tab.white
end

-- load colorscheme elements
--@param scheme table: colors to apply
--@param settings table: custom options to be applied to the scheme
--@return colors table: all groups and its respectives colors
function M.load_colors(scheme)
        -- local opts = config.get_options()

        local colors = {
                ---------------------
                --  EDITOR COLORS  --
                ---------------------
                Normal                          = { fg = scheme.foreground,     bg = scheme.background,         scheme.none },
                NormalFloat                     = { fg = scheme.foreground,     bg = scheme.background_alt,     scheme.none },
                Terminal                        = { link = "Normal"  },
                Visual                          = { fg = scheme.yellow,         bg = scheme.background_alt,     scheme.none },
                VisualNOS                       = { link = "Visual"  },
                Cursor                          = { fg = scheme.background,     bg = scheme.foreground,         scheme.none },
                CursorLine                      = { fg = scheme.none,           bg = scheme.background_alt,     scheme.none },
                CursorColumn                    = { link = "CursorLine" },
                CursorLineNr                    = { fg = scheme.orange,         bg = scheme.none,               scheme.none },
                LineNr                          = { fg = scheme.grey,           bg = scheme.none,               scheme.none },
                VertSplit                       = { fg = scheme.grey,           bg = scheme.none,               scheme.none },
                SignColumn                      = { fg = scheme.yellow,         bg = scheme.none,               scheme.none },
                Folded                          = { fg = scheme.orange,         bg = scheme.background_alt,     scheme.none },

                ---------------------
                ---- STATUSLINE -----
                ---------------------
                StatusLine                      = { fg = scheme.none,           bg = scheme.background,         scheme.none },
                StatusLineTerm                  = { fg = scheme.none,           bg = scheme.green,              scheme.none },
                StatusLineNF                    = { fg = scheme.foreground,     bg = scheme.background_alt,     scheme.none },
                StatusLineNC                    = { fg = scheme.none,           bg = scheme.none,               scheme.none },
                Top                             = { fg = scheme.background,     bg = scheme.foreground_alt,     scheme.none },
                Middle                          = { fg = scheme.foreground,     bg = scheme.background_alt,     scheme.none },
                Bottom                          = { fg = scheme.darkcyan,       bg = scheme.background,         scheme.none },
                NormalMode                      = { fg = scheme.black,          bg = scheme.green,              style = "bold" },
                VisualMode                      = { fg = scheme.black,          bg = scheme.magenta,            style = "bold" },
                InsertMode                      = { fg = scheme.black,          bg = scheme.cyan,               style = "bold" },
                ReplaceMode                     = { fg = scheme.black,          bg = scheme.orange,             style = "bold" },
                CommandMode                     = { fg = scheme.black,          bg = scheme.yellow,             style = "bold" },

                ---------------------
                ----- MESSAGES ------
                ---------------------
                Title                           = { fg = scheme.orange,         bg = scheme.none,               style = "bold" },
                ErrorMsg                        = { fg = scheme.yellow,         bg = scheme.darkred,            style = "bold" },
                ModeMsg                         = { fg = scheme.none,           bg = scheme.none,               style = "bold" },
                MoreMsg                         = { fg = scheme.green,          bg = scheme.none,               style = "bold" },
                WarningMsg                      = { fg = scheme.red,            bg = scheme.none,               style = "bold" },

                ---------------------
                ------- MENUS -------
                ---------------------
                Pmenu                           = { fg = scheme.foreground,     bg = scheme.background_alt,     scheme.none },
                PmenuSel                        = { fg = scheme.background,     bg = scheme.darkgreen,          style = "bold" },
                PmenuSbar                       = { fg = scheme.none,           bg = scheme.background_alt,     scheme.none },
                PmenuThumb                      = { link = "PmenuSbar"  },
                WildMenu                        = { link = "PmenuSel"  },

                ---------------------
                ------- MENUS -------
                ---------------------
                Conceal                         = { fg = scheme.grey,           bg = scheme.background_alt,     scheme.none },
                Directory                       = { fg = scheme.magenta,        bg = scheme.none,               style = "bold" },
                NonText                         = { fg = scheme.blue,           bg = scheme.none,               scheme.none },
                EndOfBuffer                     = { link = "Nontext"  },
                Question                        = { fg = scheme.green,          bg = scheme.none,               style = "bold" },
                Search                          = { fg = scheme.background,     bg = scheme.grey,               scheme.none },
                QuickFixLine                    = { link = "Search" },
                IncSearch                       = { fg = scheme.none,           bg = scheme.none,               style = "reverse" },
                SpecialKey                      = { fg = scheme.green,          bg = scheme.none,               scheme.none },

                ---------------------
                ---- IDENTFIERS -----
                ---------------------
                MatchParen                      = { fg = scheme.background,     bg = scheme.blue,               style = "bold" },
                Comment                         = { fg = scheme.grey,           bg = scheme.none,               scheme.none },
                Ignore                          = { link = "Comment" },
                Whitespace                      = { link = "Comment" },
                Constant                        = { fg = scheme.green,          bg = scheme.none,               scheme.none },
                Boolean                         = { link = "Constant" },
                Character                       = { link = "Constant" },
                Number                          = { link = "Constant" },
                Float                           = { link = "Constant" },
                String                          = { link = "Constant" },
                Error                           = { link = "ErrorMsg" },
                Identifier                      = { fg = scheme.blue,           bg = scheme.none,               style = "bold" },
                Function                        = { link = "Identifier" },
                PreProc                         = { fg = scheme.red,            bg = scheme.none,               scheme.none },
                Define                          = { link = "PreProc" },
                Include                         = { link = "PreProc" },
                Macro                           = { link = "PreProc" },
                PreCondit                       = { link = "PreProc" },
                Special                         = { fg = scheme.orange,         bg = scheme.none,               scheme.none },
                SpecialChar                     = { link = "Special" },
                SpecialComment                  = { link = "Special" },
                Debug                           = { link = "Special" },
                Delimiter                       = { link = "Special" },
                Tag                             = { link = "Special" },
                Statement                       = { fg = scheme.magenta,        bg = scheme.none,               scheme.none },
                Conditional                     = { link = "Statement" },
                Exception                       = { link = "Statement" },
                Keyword                         = { link = "Statement" },
                Label                           = { link = "Statement" },
                Operator                        = { link = "Statement" },
                Repeat                          = { link = "Statement" },
                Todo                            = { fg = scheme.black,          bg = scheme.yellow,             style = "bold" },
                Type                            = { fg = scheme.yellow,         bg = scheme.none,               style = "bold" },
                StorageClass                    = { link = "Type" },
                Structure                       = { link = "Type" },
                Typedef                         = { link = "Type" },
                Underlined                      = { fg = scheme.darkblue,       bg = scheme.none,               style = "underline" },

                ---------------------
                -- LANGUAGE COLORS --
                ---------------------
                ---------
                -- GIT --
                ---------
                signifySignAdd                  = { fg = scheme.green,          bg = scheme.none,               scheme.none },
                signifySignChange               = { fg = scheme.yellow,         bg = scheme.none,               scheme.none },
                signifySignDelete               = { fg = scheme.red,            bg = scheme.none,               scheme.none },
                gitcommitComment                = { fg = scheme.grey,           bg = scheme.none,               scheme.none },
                gitcommitDiscardedType          = { fg = scheme.red,            bg = scheme.none,               scheme.none },
                gitcommitSelectedType           = { fg = scheme.green,          bg = scheme.none,               scheme.none },
                gitcommitHeader                 = { fg = scheme.none,           bg = scheme.none,               scheme.none },
                gitcommitUntrackedFile          = { fg = scheme.cyan,           bg = scheme.none,               scheme.none },
                gitcommitDiscardedFile          = { fg = scheme.red,            bg = scheme.none,               scheme.none },
                gitcommitSelectedFile           = { fg = scheme.green,          bg = scheme.none,               scheme.none },
                gitcommitUnmergedFile           = { fg = scheme.yellow,         bg = scheme.none,               scheme.none },
                gitcommitUnmerged               = { fg = scheme.green,          bg = scheme.none,               scheme.none },
                gitcommitOnBranch               = { fg = scheme.none,           bg = scheme.none,               scheme.none },
                gitcommitBranch                 = { fg = scheme.magenta,        bg = scheme.none,               scheme.none },

                ----------
                -- diff --
                ----------
                diffAdded                       = { fg = scheme.green,          bg = scheme.none,               scheme.none },
                diffFile                        = { fg = scheme.orange,         bg = scheme.none,               scheme.none },
                diffNewFile                     = { fg = scheme.yellow,         bg = scheme.none,               scheme.none },
                diffChanged                     = { fg = scheme.cyan,           bg = scheme.none,               scheme.none },
                diffRemoved                     = { fg = scheme.red,            bg = scheme.none,               scheme.none },
                diffLine                        = { fg = scheme.blue,           bg = scheme.none,               scheme.none },

                ----------------
                -- LSP COLORS --
                ----------------
                DiagnosticVirtualTextWarn       = { fg = scheme.orange,         bg = scheme.none,               scheme.none },
                DiagnosticUnderlineWarn         = { fg = scheme.orange,         bg = scheme.none,               style = "underline" },
                DiagnosticFloatingWarn          = { link = "DiagnosticVirtualTextWarn" },
                DiagnosticSignWarn              = { link = "DiagnosticVirtualTextWarn" },

                DiagnosticVirtualTextError      = { fg = scheme.red,            bg = scheme.none,               scheme.none },
                DiagnosticUnderlineError        = { fg = scheme.red,            bg = scheme.none,               style = "underline" },
                DiagnosticFloatingError         = { link = "DiagnosticVirtualTextError" },
                DiagnosticSignError             = { link = "DiagnosticVirtualTextError" },

                DiagnosticVirtualTextInfo       = { fg = scheme.blue,           bg = scheme.none,               scheme.none },
                DiagnosticUnderlineInfo         = { fg = scheme.blue,           bg = scheme.none,               style = "underline" },
                DiagnosticFloatingInfo          = { link = "DiagnosticVirtualTextInfo" },
                DiagnosticSignInfo              = { link = "DiagnosticVirtualTextInfo" },

                DiagnosticVirtualTextHint       = { fg = scheme.yellow,         bg = scheme.none,               scheme.none },
                DiagnosticUnderlineHint         = { fg = scheme.yellow,         bg = scheme.none,               style = "underline" },
                DiagnosticFloatingHint          = { link = "DiagnosticVirtualTextHint" },
                DiagnosticSignHint              = { link = "DiagnosticVirtualTextHint" },

                --------------------
                -- LUASNIP COLORS --
                --------------------
                LuaSnipInactive                 = { link = "Comment" },
                LuaSnipChoice                   = { fg = scheme.yellow,         bg = scheme.none,               scheme.none },
                LuaSnipFunction                 = { fg = scheme.magenta,        bg = scheme.none,               scheme.none },
                LuaSnipInsert                   = { fg = scheme.blue,           bg = scheme.none,               scheme.none },

                ----------------
                -- CMP COLORS --
                ----------------
                CmpItemKindVariable             = { fg = scheme.none,       bg = scheme.none,               scheme.none },
                CmpItemKindClass                = { fg = scheme.yellow,     bg = scheme.none,               scheme.none },
                CmpItemKindInterface            = { link = "CmpItemKindClass" },
                CmpItemKindModule               = { link = "CmpItemKindClass" },
                CmpItemKindText                 = { fg = scheme.green,      bg = scheme.none,               scheme.none },
                CmpItemKindKeyword              = { fg = scheme.orange,     bg = scheme.none,               scheme.none },
                CmpItemKindFunction             = { fg = scheme.blue,       bg = scheme.none,               scheme.none },
                CmpItemKindMethod               = { link = "CmpItemKindFunction" },

                ----------------
                -- COQ COLORS --
                ----------------
                CoqtailChecked                  = { fg = scheme.none,           bg = static.coq_checked,          scheme.none },
                CoqtailSent                     = { fg = scheme.none,           bg = static.coq_sent,             scheme.none },
        }

        terminal_colors(scheme)
        return colors
end

return M
