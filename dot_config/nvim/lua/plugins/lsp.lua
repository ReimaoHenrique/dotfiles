return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- safe load do cmp (evita crash)
      local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = ok and cmp_lsp.default_capabilities()
        or vim.lsp.protocol.make_client_capabilities()

      -- LSPs ativos
      vim.lsp.enable({
        "rust_analyzer",
        "ts_ls",
        "angularls",
      })

      -- Rust
      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
      })

      -- TypeScript
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      -- Angular
      vim.lsp.config("angularls", {
        capabilities = capabilities,

        on_new_config = function(new_config, root_dir)
          new_config.cmd = {
            "ngserver",
            "--stdio",
            "--tsProbeLocations",
            root_dir .. "/node_modules",
            "--ngProbeLocations",
            root_dir .. "/node_modules",
          }
        end,
      })
    end,
  },
}
