-- set leader key
vim.g.mapleader = " "

vim.opt.guicursor = ""

-- set number line
vim.opt.nu = true
-- set relative number line
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.culopt = "line,number"
-- vim.cmd[[highlight CursorColumn guibg=#c83e4d]]
vim.cmd[[highlight CursorLine guibg=#32373B]]
vim.cmd[[highlight ColorColumn guibg=#F4B860]]
vim.cmd[[highlight ColorColumn guibg=#5B5F97]]

vim.showmode = false

