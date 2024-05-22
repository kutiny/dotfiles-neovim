return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.2',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
        vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})

        require('telescope').setup({
            defaults = {
                -- NOTE: this is the only thing that works for hidden files search in rp
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--hidden",
                    "--smart-case",
                },
                -- mappings = {
                --     n = {
                --         ["x"] = require("telescope.actions").delete_buffer,
                --         ["Esc"] = "close",
                --         ["q"] = require("telescope.actions").add_selected_to_qflist
                --         + require("telescope.actions").open_qflist,
                --         ["Q"] = require("telescope.actions").send_selected_to_qflist
                --         + require("telescope.actions").open_qflist,
                --     },
                --     i = {
                --         ["<C-Down>"] = require("telescope.actions").cycle_history_next,
                --         ["<C-Up>"] = require("telescope.actions").cycle_history_prev,
                --     },
                -- },
                -- Default configuration for telescope goes here:
                -- config_key = value,
                -- ..
            },
            pickers = {
                colorscheme = {
                    enable_preview = true,
                },
                find_files = {
                    hidden = true,
                },
                live_grep = {
                    hidden = true, -- Look note on top
                },
                buffers = {
                    initial_mode = "normal",
                    hidden = true,
                },
                git_commits = {
                    initial_mode = "normal",
                },
                git_bcommits = {
                    initial_mode = "normal",
                },
                git_status = {
                    initial_mode = "normal",
                },
                lsp_references = {
                    initial_mode = "normal",
                },
                resume = {
                    initial_mode = "normal",
                },
            },
            extensions = {},
        })
    end
}
