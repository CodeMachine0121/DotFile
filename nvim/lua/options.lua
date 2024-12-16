require "nvchad.options"

-- add yours here!
local go = vim.g
local o = vim.o

-- map <leader>
go.mapleader = " "

-- editor option

o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"
o.syntax = "on"
o.autoindent = true
o.cursorline = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.encoding = "UTF-8"
o.ruler = true
o.mouse = "a"
o.title = true
o.hidden = true
o.ttimeoutlen = 0
o.wildmenu = true
o.showcmd = true
o.showmatch = true
o.inccommand = "split"
o.cursorlineopt ='both'

-- Optimizations on startup
vim.loader.enable()

go.lualine_info_extras = false
go.codeium_cmp_hide = false
go.lazygit_config = false

-- Define leader key
go.mapleader = " "
go.maplocalleader = "\\"

go.autoformat = true
go.gui_font_default_size = 10
go.gui_font_size = go.gui_font_default_size
go.gui_font_face = "JetBrainsMono Nerd Font"
go.editorconfig = true


o.showcmd = false
o.laststatus = 3
o.cmdheight = 0
o.spell = true
o.breakindent = true
o.smoothscroll = true

o.conceallevel = 2

vim.cmd([[
  try
    colorscheme NeoSolarized
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
