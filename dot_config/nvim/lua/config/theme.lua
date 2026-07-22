local M = {}
M.theme_file = vim.fn.stdpath("data") .. "/theme.txt"

M.save_theme = function(theme)
  local file = io.open(M.theme_file, "w")
  if file then
    file:write(theme)
    file:close()
  end
end

M.get_saved_theme = function()
  local file = io.open(M.theme_file, "r")
  if file then
    local theme = file:read("*a")
    file:close()
    return theme:gsub("%s+", "")
  end
  return "rose-pine"
end

-- Comando para mudar o tema via comando
vim.api.nvim_create_user_command("Theme", function(opts)
  local theme = opts.args
  vim.cmd("colorscheme " .. theme)
  M.save_theme(theme)
end, {
  nargs = 1,
  complete = function(arg_lead, cmd_line, cursor_pos)
    return { "rose-pine", "everforest" }
  end,
})

-- Carregar o tema salvo na inicialização
vim.cmd("colorscheme " .. M.get_saved_theme())

return M
