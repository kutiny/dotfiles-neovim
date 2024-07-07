return {
    'stevearc/aerial.nvim',
    opts = {},
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require('aerial').setup({
            close_on_select = true,
            -- optionally use on_attach to set keymaps when aerial has attached to a buffer
            -- on_attach = function(bufnr)
                -- Jump forwards/backwards with '{' and '}'
                -- vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
                -- vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
            -- end
        })
        vim.keymap.set('n', '<leader>o', '<cmd>AerialToggle left<CR>')
    end
}
