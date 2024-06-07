return {
    'm4xshen/autoclose.nvim',
    event = 'VeryLazy',
    config = function() require("autoclose").setup({
        options = {
            disable_command_mode = true,
        }
    }) end
}
