require("juan.remap")
require("juan.set")
require("juan.lazy_init")

local augroup = vim.api.nvim_create_augroup
local juanGroup = augroup('juan', {})

local autocmd = vim.api.nvim_create_autocmd

function R(name)
  require("plenary.reload").reload_module(name)
end

autocmd('LspAttach', {
  group = juanGroup,
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
