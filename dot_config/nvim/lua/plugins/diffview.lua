return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("diffview").setup({
      enhanced_diff_hl = true,
      view = {
        -- Força o painel de arquivos (file_panel) a abrir na direita (right)
        default = {
          layout = "diff2_horizontal",
          disable_diagnostics = true,
        },
      },
      file_panel = {
        listing_style = "tree", -- Mostra os arquivos alterados em formato de árvore
        tree_max_folder_depth = 3,
        win_config = {
          position = "right", -- FIXO NA DIREITA
          width = 35,         -- PEQUENO E ESTÁTICO
        },
      },
    })

    -- Atalho para abrir/fechar o mapa de alterações do Git
    vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Abrir Git Diff View" })
    vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<CR>", { desc = "Fechar Git Diff View" })
  end
}
