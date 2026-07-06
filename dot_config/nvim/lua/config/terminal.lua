local M = {}

function M.terminal_bottom()
  local buf = vim.api.nvim_create_buf(false, true)

  local width = vim.o.columns
  local height = math.floor(vim.o.lines * 0.30)

  local row = vim.o.lines - height
  local col = 0

  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "none",
  })

  vim.fn.termopen(vim.o.shell)
  vim.cmd("startinsert")
end

return M
