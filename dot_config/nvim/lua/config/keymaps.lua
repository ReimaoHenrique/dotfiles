local map = vim.keymap.set
local terminal = require("config.terminal")

vim.keymap.set("n", "<leader>t", function()
  vim.cmd("botright 8split | terminal " .. vim.o.shell)
  vim.cmd("startinsert")
end, { desc = "Terminal inferior pequeno" })


vim.keymap.set("n", "<leader>q", "<cmd>q<CR>")

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

map("n", "<leader>z", "<cmd>ZenMode<CR>", {
  desc = "Toggle Zen Mode",
})

map("n", "<leader>e", "<cmd>Neotree toggle<CR>", {
  desc = "Explorer",
})

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {
  desc = "Find files",
})
