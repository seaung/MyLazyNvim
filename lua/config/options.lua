-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local opt = vim.opt -- 简写,方便后续使用

opt.spell = false -- 禁止拼写
opt.wrap = true -- 自动折行
opt.relativenumber = false -- 禁用相对行号
opt.list = true -- 显示空白字符
opt.listchars = { space = "." }

vim.g.lazyvim_rust_diagnostics = "rust-analyzer" -- 开启rust插件功能
