local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local snippets = {
  -- 1. if 語句
  s("if", fmt([[
if ({}) {{
  {}
}}]], {
    i(1, "condition"),
    i(2, "// code")
  })),

  -- 2. else 語句（單獨的 else 塊）
  s("el", fmt([[
else {{
  {}
}}]], {
    i(1, "// code")
  })),

  -- 3. if-else 語句
  s("ife", fmt([[
if ({}) {{
  {}
}} else {{
  {}
}}]], {
    i(1, "condition"),
    i(2, "// code"),
    i(3, "// code")
  })),

  -- 額外加入：else if 語句
  s("elif", fmt([[
else if ({}) {{
  {}
}}]], {
    i(1, "condition"),
    i(2, "// code")
  })),
}

return snippets
