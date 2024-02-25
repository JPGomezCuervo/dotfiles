return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "go", "javascript", "c", "cpp" },
        indent = {enable = false},
        autotag = {
          enable = true,
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          disable = {"latex"},
          additional_vim_regex_highlighting = false,
        }
      })
    end
  }
