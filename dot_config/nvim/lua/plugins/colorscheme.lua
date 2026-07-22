return {
  -- Rose Pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "auto",
        dark_variant = "main",
      })
    end,
  },
  -- Everforest
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      -- Algumas configurações opcionais antes de carregar
      vim.g.everforest_background = 'hard'
      vim.g.everforest_transparent_background = 1
    end,
  },
}
