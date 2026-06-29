return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    { 'nvim-tree/nvim-web-devicons', enabled = true },
  },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Buscar Arquivos' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Buscar Texto' })
  end
}