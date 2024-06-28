vim.g.mapleader = " "

-- Used by Oil now
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- set J to append next line to current without moving the cursor to the end
vim.keymap.set("n", "J", "mzJ`z")

-- PG UP PG DOWN
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search and stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste and remain current clipboard
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Enable plus register to copy to system
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Enable plus register to cut to system
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- While in vertical mode edit <C-c> edits
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

-- Enable when lsp is configured
vim.keymap.set("n", "<leader>ff", function()
    vim.lsp.buf.format()
end)

-- tmux panels
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- LSP Rename
vim.keymap.set("n", "<leader>lr", ":lua vim.lsp.buf.rename()\n")

-- LSP Messages
vim.keymap.set(
    "n",
    "]d",
    "<cmd>lua vim.diagnostic.goto_next()<CR>",
    { silent = true, desc = "Next diagnostic" }
)
vim.keymap.set(
    "n",
    "[d",
    "<cmd>lua vim.diagnostic.goto_prev()<CR>",
    { silent = true, desc = "Prev diagnostic" }
)


vim.keymap.set(
    "t",
    "<Esc><Esc>",
    "<C-\\><C-n>", { desc = "Exit terminal mode" }
)

-- vim.api.nvim_create_user_command(
--     "ClearWorkspace",
--     function()
--         local buffers = {}
--         for i, buf_handl in ipairs(vim.api.nvim_list_bufs()) do
--             if vim.api.nvim_buf_is_loaded(buf_handl) then
--                 buffers[i] = buf_handl
--             end
--         end
--     end,
--     {}
-- )

