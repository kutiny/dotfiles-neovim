local theme = "rose-pine"
local theme_file = "~/.nvim_theme"

local function _set_colorscheme(color)
    if color then
        vim.fn.system("echo -n " .. color .. " > " .. theme_file)
    else
        color = vim.fn.system("cat " .. theme_file .. " 2> /dev/null | tr -d '\n'")
    end

    if color == "" then
        color = theme
    end

    -- local colors = require("catppuccin.palettes").get_palette()
    -- local TelescopeColor = {
    --     TelescopeMatching = { fg = colors.flamingo },
    --     TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
    --     TelescopePromptPrefix = { bg = colors.surface0 },
    --     TelescopePromptNormal = { bg = colors.surface0 },
    --     TelescopeResultsNormal = { bg = colors.mantle },
    --     TelescopePreviewNormal = { bg = colors.mantle },
    --     TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
    --     TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
    --     TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
    --     TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
    --     TelescopeResultsTitle = { fg = colors.mantle },
    --     TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
    -- }

    -- for hl, col in pairs(TelescopeColor) do
    --     vim.api.nvim_set_hl(0, hl, col)
    -- end

    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

local function _get_theme_list()
    local cmd = "cat ~/.dotfiles/nvim/lua/plugins/colors.lua | grep -E ' name = .*' | grep -v -E 'cmd' | tr -d ' '"
    local output = vim.fn.system(cmd)
    local content = vim.split(output, "\n")
    local themes = {}

    for _, v in ipairs(content) do
        local t = string.gsub(v, "'", "")
        t = string.gsub(t, "name=", "")
        t = string.gsub(t, ",", "")
        if t == "" then
            goto continue
        end
        table.insert(themes, t)
        ::continue::
    end

    return themes
end

local function open_theme_window(themes)
    local win = vim.api.nvim_list_uis()
    local width = 80

    if #win > 0 then
        width = math.floor(win[1].width * 0.7)
    end

    local height = 8
    local bufnr = vim.api.nvim_create_buf(false, true)
    local win_id = vim.api.nvim_open_win(bufnr, true, {
        relative = "editor",
        title = "Themes",
        title_pos = "center",
        row = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        width = width,
        height = height,
        style = "minimal",
        border = "single",
    })

    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, themes)
    local current_theme = vim.g.colors_name

    local function handle_exit()
        _set_colorscheme(current_theme)
        vim.cmd('q')
    end

    local function process_change()
        local t = vim.api.nvim_get_current_line()
        _set_colorscheme(t)
        return t
    end

    vim.keymap.set('n', 'q', function()
        handle_exit()
    end, { buffer = bufnr, silent = true })

    vim.keymap.set('n', '<CR>', function()
        local t = process_change()
        current_theme = t;
        handle_exit()
    end, { buffer = bufnr, silent = true })

    vim.keymap.set('n', 'j', function()
        local line_number = vim.api.nvim_win_get_cursor(win_id)[1]
        local next_line = line_number + 1

        if next_line > vim.api.nvim_buf_line_count(bufnr) then
            next_line = 1
        end

        vim.cmd("norm" .. next_line .. 'G')
        process_change()
    end, { buffer = bufnr, silent = true })

    vim.keymap.set('n', 'k', function()
        local cursor = vim.api.nvim_win_get_cursor(win_id)

        if cursor[1] == 1 then
            cursor[1] = vim.api.nvim_buf_line_count(bufnr)
        else
            cursor[1] = cursor[1] - 1
        end

        vim.api.nvim_win_set_cursor(win_id, { cursor[1], cursor[2] })
        process_change()
    end, { buffer = bufnr, silent = true })
end

vim.keymap.set('n', '<leader>t', function()
    local theme_list = _get_theme_list()
    open_theme_window(theme_list)
end)

return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
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
        'dracula/vim',
        name = 'dracula',
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
        init = function()
            _set_colorscheme()
        end,
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
