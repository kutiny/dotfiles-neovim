return {
    'nvimdev/dashboard-nvim',
    lazy = false,
    event = 'VimEnter',
    config = function()
        local function generate_header()
            local week = {
                ['Sunday'] = {
                    '',
                    ' _____           _         ',
                    '|   __|_ _ ___ _| |___ _ _ ',
                    '|__   | | |   | . | .\'| | |',
                    '|_____|___|_|_|___|__,|_  |',
                    '                      |___|',
                },
                ['Monday'] = {
                    '',
                    ' _____           _         ',
                    '|     |___ ___ _| |___ _ _ ',
                    '| | | | . |   | . | .\'| | |',
                    '|_|_|_|___|_|_|___|__,|_  |',
                    '                      |___|',
                    '',
                },
                ['Tuesday'] = {
                    '',
                    ' _____               _         ',
                    '|_   _|_ _ ___ ___ _| |___ _ _ ',
                    '  | | | | | -_|_ -| . | .\'| | |',
                    '  |_| |___|___|___|___|__,|_  |',
                    '                          |___|',
                },
                ['Wednesday'] = {
                    '',
                    ' _ _ _       _               _         ',
                    '| | | |___ _| |___ ___ ___ _| |___ _ _ ',
                    '| | | | -_| . |   | -_|_ -| . | .\'| | |',
                    '|_____|___|___|_|_|___|___|___|__,|_  |',
                    '                                  |___|',
                },
                ['Thursday'] = {
                    '',
                    ' _____ _                 _         ',
                    '|_   _| |_ _ _ ___ ___ _| |___ _ _ ',
                    '  | | |   | | |  _|_ -| . | .\'| | |',
                    '  |_| |_|_|___|_| |___|___|__,|_  |',
                    '                              |___|',
                },
                ['Friday'] = {
                    '',
                    ' _____     _   _         ',
                    '|   __|___|_|_| |___ _ _ ',
                    '|   __|  _| | . | .\'| | |',
                    '|__|  |_| |_|___|__,|_  |',
                    '                    |___|',
                },
                ['Saturday'] = {
                    '',
                    ' _____     _             _         ',
                    '|   __|___| |_ _ _ ___ _| |___ _ _ ',
                    '|__   | .\'|  _| | |  _| . | .\'| | |',
                    '|_____|__,|_| |___|_| |___|__,|_  |',
                    '                              |___|',
                },
            }
            local daysoftheweek =
            { 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday' }
            local day = daysoftheweek[os.date('*t').wday]
            local tbl = week[day]
            table.insert(tbl, os.date('%d/%m/%Y'))
            table.insert(tbl, '')
            return tbl
        end

        vim.cmd('highlight KittyConf guifg=#2f7366')

        require('dashboard').setup {
            theme = 'hyper',
            config = {
                header = generate_header(),
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
                        icon = ' ',
                        icon_hl = '@variable',
                        desc = 'Files',
                        group = 'Label',
                        action = 'Oil',
                        key = 'f',
                    },
                    {
                        desc = ' dotfiles',
                        group = 'Number',
                        action = 'e ~/.dotfiles',
                        key = 'd',
                    },
                    {
                        desc = ' kittyconf',
                        group = 'KittyConf',
                        action = 'e ~/.dotfiles/kitty/kitty.conf',
                        key = 'k',
                    },
                },
            },
        }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
