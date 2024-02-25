return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    require("telescope").setup({})

    local builtin = require ("telescope.builtin")
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

    -- TODO: remove this if not used
    vim.keymap.set('n', '<leader>pws', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)

    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    
  end
  }
