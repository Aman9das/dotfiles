-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.env.SHELL = '/usr/bin/zsh'
vim.env.PATH = '~/.local/bin/:' .. vim.env.PATH
vim.opt.wildignorecase = true
vim.opt.exrc = true
