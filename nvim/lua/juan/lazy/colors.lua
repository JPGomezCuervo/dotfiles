return {
  "rebelot/kanagawa.nvim",
  name = "kanagawa",
  config = function()
    require("kanagawa").setup({
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none"
            }
          }
        }
      },
      background = {
        dark = "dragon",
      }
    })
    vim.cmd("colorscheme kanagawa")
  end
}
