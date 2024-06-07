return {
    'f-person/git-blame.nvim',
    config = function()
        require('gitblame').setup({
            enabled = false,
            delay = 100,
        })
    end,
    event = "VeryLazy",
    init = function()
        vim.keymap.set(
            "n",
            "<Leader>bb",
            ":GitBlameToggle<CR>"
        )
    end
}
