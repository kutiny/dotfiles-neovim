return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            theme = 'hyper',
            config = {
                week_header = {
                    enable = true,
                },
                project = {
                    enable = false,
                },
                mru = {
                    limit = 5,
                    label = ' Recent files:',
                },
                disable_move = false, -- boolean default is false disable move key
                footer = {
                    '',
                    '',
                    '🚀 Streamlined processes pave the way for seamless development.'
                },
                shortcut = {
                    { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
                    {
                        icon = ' ',
                        icon_hl = '@variable',
                        desc = 'Files',
                        group = 'Label',
                        action = 'Telescope find_files',
                        key = 'f',
                    },
                    {
                        desc = ' Apps',
                        group = 'DiagnosticHint',
                        action = 'Telescope app',
                        key = 'a',
                    },
                    {
                        desc = ' dotfiles',
                        group = 'Number',
                        action = 'Telescope dotfiles',
                        key = 'd',
                    },
                },
            },
        }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
