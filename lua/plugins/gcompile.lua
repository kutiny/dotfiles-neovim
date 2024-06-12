return {
    'kutiny/gcompile.nvim',
    config = function()
        local mod = require('gcompile')
        mod.setup({
            split = 'vertical'
        })

        vim.keymap.set("n", "<Leader>rr", ":GCompileAndRun<CR>")
        vim.keymap.set("n", "<Leader>re", ":GCompileRunAndExit<CR>")
    end
}
