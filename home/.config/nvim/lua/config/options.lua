-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.clipboard:remove("unnamed")
vim.opt.clipboard:remove("unnamedplus")

vim.cmd([[
  command! Wq wq
]])
