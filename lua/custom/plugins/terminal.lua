return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = function(term)
          if term.direction == 'horizontal' then
            return 15
          elseif term.direction == 'horizontal' then
            return vim.o.columns * 0.4
          elseif term.direction == 'horizontal' then
            return 20
          end
        end,
        open_mapping = [[<c-\>]], -- Use a temporary mapping
        direction = 'float', -- Set direction to 'float' for floating terminal
        float_opts = {
          border = 'curved',
          width = function()
            return math.floor(vim.o.columns * 0.8)
          end,
          height = function()
            return math.floor(vim.o.lines * 0.8)
          end,
        },
        on_create = function(t) end,
        on_open = function(term)
          vim.cmd 'startinsert'
        end,
        on_close = function(t) end,
        on_stdout = function(t, job, data, name) end,
        on_stderr = function(t, job, data, name) end,
        on_exit = function(t, job, exit_code, name) end,
        hide_numbers = true,
        shade_filetypes = {},
      }

      -- Create a persistent terminal instance
      local Terminal = require('toggleterm.terminal').Terminal
      local persistent_term = Terminal:new {
        dir = vim.fn.getcwd(),
        direction = 'horizontal',
        float_opts = {
          border = 'curved',
          width = function()
            return math.floor(vim.o.columns * 0.8)
          end,
          height = function()
            return math.floor(vim.o.lines * 0.8)
          end,
        },
        on_open = function(term)
          vim.cmd 'startinsert'
        end,
      }

      -- Define a function to toggle the persistent terminal
      function _G.toggle_persistent_terminal()
        persistent_term:toggle()
      end

      -- Map <c-\> to toggle the persistent terminal
      vim.api.nvim_set_keymap('n', '<c-\\>', ':lua _G.toggle_persistent_terminal()<CR>', { noremap = true, silent = true })
    end,
  },
}
