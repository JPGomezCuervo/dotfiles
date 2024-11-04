return {
        "ibhagwan/fzf-lua",
        config = function()
                vim.keymap.set("n", "<leader>pf", require('fzf-lua').files, { desc = "Fzf Files" })
                vim.keymap.set("n", "<leader>ps", require('fzf-lua').live_grep, { desc = "Fzf live_grep" })
                local actions = require "fzf-lua.actions"
                require'fzf-lua'.setup {
                        winopts = {
                                border = false,
                                fullscreen = true, 
                                preview = {
                                        hidden = 'hidden',
                                },
                        },
                        keymap = {
                                builtin = {
                                        false,
                                        ["<M-Esc>"] = "hide",     
                                        ["<F1>"] = "toggle-help",
                                        ["<F2>"] = "toggle-fullscreen",
                                        ["<F3>"] = "toggle-preview-wrap",
                                        ["<F4>"] = "toggle-preview",
                                        ["<F5>"] = "toggle-preview-ccw",
                                        ["<F6>"] = "toggle-preview-cw",
                                        ["<S-down>"] = "preview-page-down",
                                        ["<S-up>"] = "preview-page-up",
                                        ["<M-S-down>"] = "preview-down",
                                        ["<M-S-up>"] = "preview-up",
                                },
                                fzf = {
                                        false,
                                        ["ctrl-z"] = "abort",
                                        ["ctrl-u"] = "unix-line-discard",
                                        ["ctrl-f"] = "half-page-down",
                                        ["ctrl-b"] = "half-page-up",
                                        ["ctrl-a"] = "beginning-of-line",
                                        ["ctrl-e"] = "end-of-line",
                                        ["alt-a"] = "toggle-all",
                                        ["alt-g"] = "last",
                                        ["alt-G"] = "first",
                                        ["f3"]= "toggle-preview-wrap",
                                        ["f4"]= "toggle-preview",
                                        ["shift-down"] = "preview-page-down",
                                        ["shift-up"] = "preview-page-up",
                                },
                        },
                        actions = {
                                files = {
                                        false,
                                        ["ctrl-y"] = actions.file_edit_or_qf,
                                        ["enter"] = actions.file_edit_or_qf,
                                        ["ctrl-s"] = actions.file_split,
                                        ["ctrl-v"] = actions.file_vsplit,
                                        ["ctrl-t"] = actions.file_tabedit,
                                        ["alt-q"] = actions.file_sel_to_qf,
                                        ["alt-Q"] = actions.file_sel_to_ll,
                                },
                        },
                }
        end
}
