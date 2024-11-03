-- remap
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set({"n", "x"}, "cp", '"+y"') --x covers all visual modes
vim.keymap.set({"n", "x"}, "cv", '"+p"')
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") --gv reselects the las selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<esc>", ":set hls! <CR>")

-- options
vim.o.timeoutlen = 300
vim.o.relativenumber = true
vim.o.guicursor = ""
vim.o.scrolloff = 4
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hidden = true -- change between buffers without saving
vim.o.colorcolumn = "80"
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.smarttab = true
vim.o.wildmenu = true

vim.o.wildignore:append("**/node_modules/**")
vim.opt.path:append("**")

-- vim.o.wildignore = vim.o.wildignore .. ",**/node_modules/**"

-- package manager: Lazyvim
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ 
          "git", 
          "clone",
          "--filter=blob:none",
          "--branch=stable",
          lazyrepo,
          lazypath 
  })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "default" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
