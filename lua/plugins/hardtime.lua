return {
   "m4xshen/hardtime.nvim",
   event = 'VeryLazy',
   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
   opts = {},
   config = function ()
       require("hardtime").setup({
            max_count = 5,
       })
   end,
   init = function ()
       vim.keymap.set(
       "n",
       "<Leader>h",
       ":Hardtime toggle<CR>"
       )
   end
}
