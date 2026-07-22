local themes = { "rose-pine", "everforest" }
local theme_config = require("config.theme")

local function select_theme()
  vim.ui.select(themes, {
    prompt = "Selecione um tema:",
  }, function(choice)
    if choice then
      vim.cmd("colorscheme " .. choice)
      theme_config.save_theme(choice)
      vim.notify("Tema salvo e alterado para: " .. choice, vim.log.levels.INFO)
    end
  end)
end

vim.api.nvim_create_user_command("MudarCor", select_theme, {})
