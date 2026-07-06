return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      close_if_last_window = false,
      popup_border_style = "rounded",

      enable_git_status = true,
      enable_diagnostics = true,

      default_component_configs = {
        container = { enable_character_fade = true },
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "󰜮",
          default = "*",
          highlight = "NeoTreeFileIcon",
        },
        modified = { symbol = "[+]", highlight = "NeoTreeModified" },
        name = { trailing_slash = false, use_git_status_colors = true },
        git_status = {
          symbols = {
            added     = "✚",
            modified  = "",
            deleted   = "✖",
            renamed   = "󰁕",
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          },
        },
      },
      filesystem = {
        filtered_items = {
          hide_gitignored = false,
          hide_by_name = { "node_modules", ".git" },
        },
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)

      -- Apenas o atalho da ESQUERDA ativo
      vim.keymap.set("n", "<leader>e", function()
        require("neo-tree.command").execute({
          source = "filesystem",
          position = "left",
          toggle = true,
        })
      end, { desc = "Neo-tree Esquerda" })
    end,
  },
}
