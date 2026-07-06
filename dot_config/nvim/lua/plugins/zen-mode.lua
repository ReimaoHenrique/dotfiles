return {
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
          showcmd = false,
        },
        twilight = { enabled = false },
        gitsigns = { enabled = false },
      },
    },
  },
}
