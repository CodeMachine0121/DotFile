-- 首先設定基本選項
vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- 檢查並載入 NeoSolarized
local ok_status, NeoSolarized = pcall(require, "NeoSolarized")
if not ok_status then
  print("NeoSolarized not found!")
  return
end

-- NeoSolarized 設定
NeoSolarized.setup {
  style = "dark",
  transparent = true,
  terminal_colors = true,
  enable_italics = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = { bold = true },
    variables = {},
    string = { italic = true },
    underline = true,
    undercurl = true,
  },
  on_highlights = function(highlights, colors) end,
}

-- 設定配色方案
vim.cmd([[
  try
    colorscheme NeoSolarized
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
