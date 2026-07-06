return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",

    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          icons_enabled = true,
          globalstatus = true,

          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },

        sections = {
          lualine_a = {
            {
              "mode",
              icon = "",
            },
          },

          lualine_b = {
            { "branch", icon = "" },
            { "diff" },
            { "diagnostics" },
          },

          lualine_c = {
            {
              "filename",
              path = 1,
              symbols = {
                modified = " ●",
                readonly = " ",
                unnamed = "[No Name]",
              },
            },
          },

          lualine_x = {
            { "encoding" },
            { "fileformat" },
            { "filetype" },
          },

          lualine_y = {
            { "progress", icon = "" },
          },

          lualine_z = {
            { "location", icon = "" },
          },
        },

        inactive_sections = {
          lualine_c = { "filename" },
          lualine_x = { "location" },
        },

        extensions = {},
      })
    end,
  },
}
