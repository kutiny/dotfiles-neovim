return {
    {
        'kutiny/colors.nvim',
        branch = 'main',
        config = function()
            local colors = require('colors')
            colors:setup({
                file = "~/.dotfiles/nvim/lua/plugins/colors.lua",
                enable_transparent_bg = true,
                fallback_theme_name = 'evergarden',
                -- theme_list = {
                --     'evergarden',
                --     'catuccin-mocha',
                --     'vscode',
                --     'dracula',
                --     'rose-pine',
                -- },
                border = 'double',
                height = 8,
                width = 60,
                callback_fn = function()
                    require('lualine').setup()
                end
            })

            vim.keymap.set('n', '<leader>t', ':ShowThemes<CR>', { silent = true })
        end
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        -- name = 'testline',
        priority = 1000,
        config = function()
            require('catppuccin').setup({
                flavour = "auto", -- latte, frappe, macchiato, mocha
                background = {    -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = true, -- disables setting the background color.
                show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
                term_colors = false,           -- sets terminal colors (e.g. `g:terminal_color_0`)
                dim_inactive = {
                    enabled = false,           -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15,         -- percentage of the shade to apply to the inactive window
                },
                no_italic = false,             -- Force no italic
                no_bold = false,               -- Force no bold
                no_underline = false,          -- Force no underline
                styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" },   -- Change the style of comments
                    conditionals = { "italic" },
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                    -- miscs = {}, -- Uncomment to turn off hard-coded styles
                },
                color_overrides = {},
                custom_highlights = {},
                default_integrations = true,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = false,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                },
            })
        end
    },
    {
        'Mofiqul/dracula.nvim',
        name = 'dracula',
        config = function()
            local dracula = require("dracula")
            dracula.setup({
                -- customize dracula color palette
                colors = {
                    bg = "#282A36",
                    fg = "#F8F8F2",
                    selection = "#44475A",
                    comment = "#6272A4",
                    red = "#FF5555",
                    orange = "#FFB86C",
                    yellow = "#F1FA8C",
                    green = "#50fa7b",
                    purple = "#BD93F9",
                    cyan = "#8BE9FD",
                    pink = "#FF79C6",
                    bright_red = "#FF6E6E",
                    bright_green = "#69FF94",
                    bright_yellow = "#FFFFA5",
                    bright_blue = "#D6ACFF",
                    bright_magenta = "#FF92DF",
                    bright_cyan = "#A4FFFF",
                    bright_white = "#FFFFFF",
                    menu = "#21222C",
                    visual = "#3E4452",
                    gutter_fg = "#4B5263",
                    nontext = "#3B4048",
                    white = "#ABB2BF",
                    black = "#191A21",
                },
                -- show the '~' characters after the end of buffers
                show_end_of_buffer = true, -- default false
                -- use transparent background
                transparent_bg = true, -- default false
                -- set custom lualine background color
                lualine_bg_color = "#44475a", -- default nil
                -- set italic comment
                italic_comment = true, -- default false
                -- overrides the default highlights with table see `:h synIDattr`
                overrides = {},
                -- You can use overrides as table like this
                -- overrides = {
                --   NonText = { fg = "white" }, -- set NonText fg to white
                --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
                --   Nothing = {} -- clear highlight of Nothing
                -- },
                -- Or you can also use it like a function to get color from theme
                -- overrides = function (colors)
                --   return {
                --     NonText = { fg = colors.white }, -- set NonText fg to white of theme
                --   }
                -- end,
            })
        end
    },
    {
        'Mofiqul/vscode.nvim',
        config = function()
            local c = require('vscode.colors').get_colors()
            require("vscode").setup({
                transparent = true,
                italic_comments = true,
                underline_links = true,
                disable_nvimtree_bg = true,
                -- color_overrides = {
                --     vscLineNumber = '#FFFFFF',
                -- },
                -- Override highlight groups (see ./lua/vscode/theme.lua)
                group_overrides = {
                    -- this supports the same val table as vim.api.nvim_set_hl
                    -- use colors from this colorscheme by requiring vscode.colors!
                    Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
                }
            })
        end,
        name = 'vscode',
    },
    {
        'comfysage/evergarden',
        priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
        opts = {
            transparent_background = true,
            contrast_dark = 'hard', -- 'hard'|'medium'|'soft'
            overrides = {},         -- add custom overrides
        },
        name = 'evergarden',
    },
    {
        'rose-pine/neovim',
        config = function()
            require("rose-pine").setup({
                variant = "auto",      -- auto, main, moon, or dawn
                dark_variant = "main", -- main, moon, or dawn
                dim_inactive_windows = false,
                extend_background_behind_borders = true,

                enable = {
                    terminal = true,
                    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                    migrations = true,        -- Handle deprecated options automatically
                },

                styles = {
                    bold = true,
                    italic = true,
                    transparency = true,
                },

                groups = {
                    border = "muted",
                    link = "iris",
                    panel = "surface",

                    error = "love",
                    hint = "iris",
                    info = "foam",
                    note = "pine",
                    todo = "rose",
                    warn = "gold",

                    git_add = "foam",
                    git_change = "rose",
                    git_delete = "love",
                    git_dirty = "rose",
                    git_ignore = "muted",
                    git_merge = "iris",
                    git_rename = "pine",
                    git_stage = "iris",
                    git_text = "rose",
                    git_untracked = "subtle",

                    h1 = "iris",
                    h2 = "foam",
                    h3 = "rose",
                    h4 = "gold",
                    h5 = "pine",
                    h6 = "foam",
                },

                highlight_groups = {
                    -- Comment = { fg = "foam" },
                    -- VertSplit = { fg = "muted", bg = "muted" },
                },

                before_highlight = function(group, highlight, palette)
                    -- Disable all undercurls
                    -- if highlight.undercurl then
                    --     highlight.undercurl = false
                    -- end
                    --
                    -- Change palette colour
                    -- if highlight.fg == palette.pine then
                    --     highlight.fg = palette.foam
                    -- end
                end,
            })
        end,
        name = 'rose-pine',
    }
}
