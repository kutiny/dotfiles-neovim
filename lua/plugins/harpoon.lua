return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = 'VeryLazy',
    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup({
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true,
            }
        })
        -- REQUIRED

        harpoon:extend({
            UI_CREATE = function(cx)
                vim.api.nvim_buf_set_keymap(0, 'n', 'J', ":m .+1<CR>gv=gv", { noremap = true })
                vim.api.nvim_buf_set_keymap(0, 'n', 'K', ":m .-2<CR>gv=gv", { noremap = true })
                vim.keymap.set('n', 'l', function() harpoon.ui:select_menu_item({ vsplit = true }) end,
                    { buffer = cx.bufnr })
                vim.keymap.set('n', 'h', function() harpoon.ui:select_menu_item({ split = true }) end,
                    { buffer = cx.bufnr })
            end
        })

        vim.keymap.set("n", "<leader>aa", function() harpoon:list():add() end)
        vim.keymap.set("n", "<leader><leader>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list(), {
                title = '  Working Files ',
                border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
                title_pos = 'center',
            })

            -- local curbuf = vim.api.nvim_buf_get_name(0)
            -- if string.find(curbuf, "__harpoon-menu__", 1, true) then
            --     vim.api.nvim_buf_set_keymap(0, 'n', 'J', ":m .+1<CR>gv=gv", { noremap = true })
            --     vim.api.nvim_buf_set_keymap(0, 'n', 'K', ":m .-2<CR>gv=gv", { noremap = true })
            -- end
        end)

        vim.keymap.set("n", "<leader>ax", function() harpoon:list():clear() end)

        vim.keymap.set("n", "<leader>aj", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<leader>ak", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<leader>al", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<leader>a;", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
    end,
}
