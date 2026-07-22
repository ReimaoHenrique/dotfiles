return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",

  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-tree/nvim-web-devicons",
      enabled = true,
    },
    "nvim-telescope/telescope-project.nvim",
  },

  config = function()
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, {
      desc = "Buscar Arquivos"
    })

    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
      desc = "Buscar Texto"
    })

    vim.keymap.set("n", "<leader>h", builtin.keymaps, {
      desc = "Mostrar atalhos"
    })

    require("telescope").setup({
      defaults = {},
    })
    require("telescope").load_extension("project")
  end,
}
