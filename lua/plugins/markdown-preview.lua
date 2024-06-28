return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    event = 'VeryLazy',
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
        -- Markdown preview
        vim.keymap.set("n", "<leader>p", ":MarkdownPreviewToggle\n", { silent = true })
    end,
    ft = { "markdown" },
}
