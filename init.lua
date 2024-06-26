vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    change_detection = {
        notify = false,
    },
    dev = {
        ---@type string | fun(plugin: LazyPlugin): string directory where you store your local plugin projects
        path = "/Users/alexis.aguirre/workspace/personal/",
        ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
        patterns = {},
        -- For example {"folke"}
        fallback = false,
        -- Fallback to git when local plugin doesn't exist
    },
})
require("kutiny")

