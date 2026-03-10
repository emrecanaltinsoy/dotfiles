-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("t", "jk", "<C-\\><C-N>", { desc = "Terminal Normal Mode" })

vim.keymap.set({ "i", "x", "n", "s" }, "<C-M-s>", "<cmd>noautocmd w<cr>", { desc = "Save without formatting" })

vim.keymap.set("n", "<leader>tt", function()
  if vim.env.TMUX then
    vim.fn.system('tmux display-popup -E -w 80% -h 70% "txs"')
  end
end, { desc = "Start txs" })
