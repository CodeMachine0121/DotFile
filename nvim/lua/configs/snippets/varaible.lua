local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt
local events = require("luasnip.util.events")
local types = require("luasnip.util.types")

-- 輔助函數：將 PascalCase 轉換為 camelCase
local function pascalToCamelCase(pascalCase)
  return pascalCase:gsub("^%u", string.lower)
end

local function create_snippet_by_type(variable_type)
  return function(_, parent)
    local match = parent.captures[1]
    -- 轉換變數名
    local variableName = pascalToCamelCase(match)
 
    return sn(nil, fmt([[{} {} = new {}({})]], {
      t(variable_type),
      t(variableName),
      t(match),
      i(1, "")
    }))
  end
end


local snippets = {
  -- 使用正確的 regex snippet 格式
  s({
    trig = "new%s+([A-Z][a-zA-Z0-9]*)%(.*%).const",
    regTrig = true,
    hidden = true,
    snippetType = "autosnippet"
  }, {
    d(1, create_snippet_by_type("const"))
  }),

  s({
    trig = "new%s+([A-Z][a-zA-Z0-9]*)%(.*%).var",
    regTrig = true,
    hidden = true,
    snippetType = "autosnippet"
  }, {
    d(1, create_snippet_by_type("var"))
  }),

  s({
    trig = "new%s+([A-Z][a-zA-Z0-9]*)%(.*%).let",
    regTrig = true,
    hidden = true,
    snippetType = "autosnippet"
  }, {
    d(1, create_snippet_by_type("let"))
  }),
}

return snippets

