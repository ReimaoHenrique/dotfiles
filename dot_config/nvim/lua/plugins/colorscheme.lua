return {
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false,
    priority = 1000,

    config = function()
      require("NeoSolarized").setup({
        style = "dark",
        transparent = true,
      })

      vim.cmd("colorscheme NeoSolarized")

      vim.api.nvim_set_hl(0, "NotifyBackground", {
        bg = "#000000",
      })
    end,
  },
}
