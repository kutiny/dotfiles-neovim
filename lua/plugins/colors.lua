local theme = "rose-pine"
local theme_file = "~/.nvim_theme"

function Color(color)

    if color then
        vim.fn.system("echo -n " .. color .. " > " .. theme_file)
    else
        color = vim.fn.system("cat " .. theme_file .. " 2> /dev/null | tr -d '\n'")
    end

    if color == "" then
        color = theme
    end

    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

vim.keymap.set('n', '<leader>t', function()
    local t= vim.fn.input("Theme > ");

    Color(t)
end)

return {
    {
        'catppuccin/nvim',
        name = "catppuccin",
        priority = 1000
    },
    {
        'dracula/vim',
        name = 'dracula',
    },
    {
        'Mofiqul/vscode.nvim',
        config = function ()
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
                    Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
                }
            })
        end
    },
    {
        'srcery-colors/srcery-vim',
        name = 'srcery',
    },
    {
        'rose-pine/neovim',
        init = function()
            Color()
        end,
        config = function()
            require("rose-pine").setup({
                variant = "auto", -- auto, main, moon, or dawn
                dark_variant = "main", -- main, moon, or dawn
                dim_inactive_windows = false,
                extend_background_behind_borders = true,

                enable = {
                    terminal = true,
                    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                    migrations = true, -- Handle deprecated options automatically
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
        end
    }
}

