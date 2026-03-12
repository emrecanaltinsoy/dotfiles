-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("t", "jk", "<C-\\><C-N>", { desc = "Terminal Normal Mode" })

vim.keymap.set({ "i", "x", "n", "s" }, "<C-M-s>", "<cmd>noautocmd w<cr>", { desc = "Save without formatting" })

vim.keymap.set("n", "<leader>tt", function()
  if vim.env.TMUX then
    vim.fn.system('tmux display-popup -T "Switch to session" -E -w 80% -h 70% "txs"')
  end
end, { desc = "Start txs" })

vim.keymap.set("n", "<leader>tk", function()
  if vim.env.TMUX then
    vim.fn.system('tmux display-popup -T "Kill session" -E -w 80% -h 70% "txs kill"')
  end
end, { desc = "Start txs kill" })

vim.keymap.set("n", "<leader>ta", function()
  if vim.env.TMUX then
    vim.fn.system('tmux display-popup -T "Add worktree" -E -w 80% -h 70% "txs wt add"')
  end
end, { desc = "Add worktree" })

vim.keymap.set("n", "<leader>tr", function()
  if vim.env.TMUX then
    vim.fn.system('tmux display-popup -T "Remove worktree" -E -w 80% -h 70% "txs wt remove"')
  end
end, { desc = "Remove worktree" })
