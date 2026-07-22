return {
  "nvimdev/dashboard-nvim",

  event = "VimEnter",

  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
    },
  },

  config = function()
    local db = require("dashboard")

    db.setup({

      theme = "doom",

      config = {

        header = {
          "",
          "██╗  ██╗███████╗███╗   ██╗██████╗ ██╗ ██████╗",
          "██║  ██║██╔════╝████╗  ██║██╔══██╗██║██╔════╝",
          "███████║█████╗  ██╔██╗ ██║██████╔╝██║██║     ",
          "██╔══██║██╔══╝  ██║╚██╗██║██╔══██╗██║██║     ",
          "██║  ██║███████╗██║ ╚████║██║  ██║██║╚██████╗",
          "╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝ ╚═════╝",
          "",
        },


        center = {

          {
            icon = "󰈞 ",
            icon_hl = "Title",
            desc = "buscar arquivos",
            desc_hl = "String",
            action = "Telescope find_files",
            key = "ff",
          },


          {
            icon = "󰉋 ",
            icon_hl = "Title",
            desc = "projetos recentes",
            desc_hl = "String",
            action = "Telescope project",
            key = "fp",
          },


          {
            icon = "󰱼 ",
            icon_hl = "Title",
            desc = "buscar texto",
            desc_hl = "String",
            action = "Telescope live_grep",
            key = "fg",
          },


          {
            icon = "󰈙 ",
            icon_hl = "Title",
            desc = "arquivos recentes",
            desc_hl = "String",
            action = "Telescope oldfiles",
            key = "fo",
          },


          {
            icon = " ",
            icon_hl = "Title",
            desc = "configuração",
            desc_hl = "String",
            action = "lua vim.cmd('edit ' .. vim.fn.stdpath('config') .. '/init.lua'); require('neo-tree.command').execute({source = 'filesystem', position = 'left', toggle = true, dir = vim.fn.stdpath('config')})",
            key = "fc",
          },


          {
            icon = "󰏔 ",
            icon_hl = "Title",
            desc = "Mason",
            desc_hl = "String",
            action = "Mason",
            key = "m",
          },


          {
            icon = "󰋜 ",
            icon_hl = "Title",
            desc = "Mudar tema",
            desc_hl = "String",
            action = "MudarCor",
            key = "t",
          },


          {
            icon = "󰒲 ",
            icon_hl = "Title",
            desc = "Lazy",
            desc_hl = "String",
            action = "Lazy",
            key = "l",
          },


          {
            icon = " ",
            icon_hl = "Title",
            desc = "sair",
            desc_hl = "String",
            action = "qa",
            key = "q",
          },

        },


        footer = {
          "",
          "By Henrique Reimão",
          "Neovim " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
          "",
        },

      },
    })
  end,
}
