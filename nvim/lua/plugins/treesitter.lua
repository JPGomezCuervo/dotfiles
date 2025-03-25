return {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
                require("nvim-treesitter.configs").setup({
                        ensure_installed = {"c", "cpp", "javascript"},
                        indent = {enable = true},
                        autotag = {enable = true,},
                        sync_install = true,
                        auto_install = true,
                        highlight = {enable = true},
                        incremental_selection = {
                                enable = false,
                                additional_vim_regex_highlighting = false,
                        }
                })
        end
}
