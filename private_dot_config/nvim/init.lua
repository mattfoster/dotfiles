require("plugins")
require("mpf.keymap")
require("mpf.plugins.telescope")
require("mpf.plugins.leap")
require("mpf.plugins.align")
require("mpf.plugins.lualine")
require("mpf.plugins.nvimtree")
require("mpf.plugins.remember")
require("mpf.plugins.toggleterm")
require("mpf.plugins.treesitter")
require("mpf.plugins.go")
require("mpf.lsp")

local set = vim.opt
set.tabstop = 4
set.softtabstop = 4
set.expandtab = true
set.shiftwidth = 4
set.smarttab = true
set.laststatus = 2
set.number = true
set.relativenumber = true
set.ignorecase = true
set.smartcase = true

set.clipboard:append('unnamedplus') -- use system clipboard

vim.opt.termguicolors = true

vim.g.terraform_align = 1
vim.g.terraform_fmt_on_save = 1
vim.g.rustfmt_autosave = 1

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.o.background = "dark"
vim.cmd([[colorscheme tokyonight]])

-- TODO
-- lazygit
-- treesitter 
