return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  config = function()
    local db = require('dashboard')

    db.setup({
      theme = 'doom',
      config = {
        header = {
          "=========================================",
          "   _  _                     _             ",
          "  | \\| | ___  ___ __  _  _ (_) _ __       ",
          "  | .` |/ -_)/ _ \\\\ \\/ /| || || || '  \\     ",
          "  |_|\\_|\\___|\\___//_/\\_\\ \\_,_||_||_|_|_|    ",
          "                                           ",
          "=========================================",
        },

        center = {
          {
            icon = '󰈞  ',
            desc = 'buscar arquivos',
            action = 'Telescope find_files',
            key = 'ff',
          },
          {
            icon = '󰊄  ',
            desc = 'projetos recentes',
            action = 'Telescope oldfiles',
            key = 'fo',
          },
          {
            icon = '󰱼  ',
            desc = 'buscar texto no projeto',
            action = 'Telescope live_grep',
            key = 'fg',
          },
          {
            icon = '  ',
            desc = 'configuração do neovim',
            action = 'edit $MYVIMRC',
            key = 'cf',
          },
          {
            icon = '󰏔  ',
            desc = 'mason',
            action = 'Mason',
            key = 'm',
          },
          {
            icon = '󰒲  ',
            desc = 'lazy.nvim',
            action = 'Lazy',
            key = 'l',
          },
          {
            icon = '  ',
            desc = 'sair',
            action = 'qa',
            key = 'q',
          },
        },

        footer = {
          "⚡ neovim carregado com sucesso!"
        }
      }
    })
  end
}
