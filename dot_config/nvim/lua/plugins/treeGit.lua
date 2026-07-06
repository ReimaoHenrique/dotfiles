return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      -- 1. CONFIGURAÇÃO DA VISTA (Fixo na DIREITA, sem float)
      view = {
        width = 35,          -- Largura fixa da árvore
        side = "right",      -- Lado DIREITO da tela 
        signcolumn = "yes",
        cursorline = false,
        float = {
          enable = false,    -- Mantém desativado o float central
        },
      },
      
      -- 2. EXPANDIR TODAS AS PASTAS AUTOMATICAMENTE
      actions = {
        open_file = {
          quit_on_open = false, -- Mantém a árvore aberta ao abrir um arquivo
        },
      },
      renderer = {
        indent_width = 3,
        icons = {
          show = {
            hidden = true
          },
          git_placement = "after",
          bookmarks_placement = "after",
          symlink_arrow = " -> ",
          glyphs = {
            folder = {
              arrow_closed = " ",
              arrow_open = " ",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = ""
            },
            default = "󱓻",
            symlink = "󱓻",
            bookmark = "",
            modified = "",
            hidden = "󱙝",
            git = {
              unstaged = "×",
              staged = "",
              unmerged = "󰧾",
              untracked = "",
              renamed = "",
              deleted = "",
              ignored = "∅"
            }
          }
        }
      },
      
      -- 3. FILTRAR E OCULTAR NODE_MODULES
      filters = {
        git_ignored = false,
        custom = { "^\\.git$", "^node_modules$" } -- Esconde .git e node_modules
      },
      
      -- 4. CONFIGURAÇÕES EXTRAS
      hijack_cursor = true,
      sync_root_with_cwd = true,
      
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    }

    -- Auto-comando para expandir tudo na direita logo após abrir a árvore
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "NvimTree",
      callback = function()
        vim.schedule(function()
          require("nvim-tree.api").tree.expand_all()
        end)
      end,
    })
  end
}
