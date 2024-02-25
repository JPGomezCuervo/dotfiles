return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
  },

  config = function()

    local cmp = require('cmp')
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities())

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "gopls", "tsserver", "clangd", "lua_ls"
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,

        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim", "it", "describe", "before_each", "after_each" },
                }
              }
            }
          }
        end,
      }
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({

      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },

      preselect = "item",
      completion = {
        completeopt = "menu,menuone,noinsert",
        autocomplete = false
      },

      window = {
        documentation = {
          max_height = 15,
          max_width = 60,
        }
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-y>"] = cmp.mapping.confirm(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
      }),

      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
      }),

    })

    vim.diagnostic.config({
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end
}
