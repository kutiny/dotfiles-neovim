return {
    'carlossgv/vcurl',
    init = function ()
        local vcurl = require('vcurl')
        vim.api.nvim_create_user_command("Vcurl", function() vcurl.run() end, { nargs = 0 })
    end,
    opts = {
        split = "vertical",
    },
}
