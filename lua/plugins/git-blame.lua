return {
    'f-person/git-blame.nvim',
    event = "VeryLazy",
    config = function()
        require('gitblame').setup({
            enabled = false,
            delay = 100,
        })
    end,
    init = function()
        vim.keymap.set(
            "n",
            "<Leader>bb",
            ":GitBlameToggle<CR>"
        )
    end
}
