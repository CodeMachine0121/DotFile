local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt

-- 輔助函數：將 PascalCase 轉換為 camelCase
local function pascalToCamelCase(str)
  if not str then return "result" end
  return str:sub(1,1):lower() .. str:sub(2)
end

-- 創建變數宣告 snippet
local function create_var_snippet(style)
  return function(_, parent)
    local match = parent.captures[1]
    
    -- 檢查是否以空白開頭並提取縮排
    local indent = ""
    if match:match("^%s+") then
      indent = match:match("^%s+")
      match = match:gsub("^%s+", "")  -- 移除開頭空白
    end
    
    -- 生成變數名
    local varName = "result"
    
    -- 處理 new ClassName() 的情況
    local className = match:match("new%s+([A-Z][a-zA-Z0-9]*)%s*%(")
    if className then
      varName = pascalToCamelCase(className)
    else
      -- 處理方法調用
      local methodName = match:match("%.([A-Z][a-zA-Z0-9]*)%s*%(")
      if methodName then
        varName = pascalToCamelCase(methodName)
      else
        -- 處理屬性訪問
        local propName = match:match("%.([a-zA-Z][a-zA-Z0-9]*)$")
        if propName then
          varName = propName
        end
      end
    end
    
    return sn(1, {
      t(indent),              -- 使用檢查到的縮排
      t(style .. " "),
      i(1, varName),
      t(" = "),
      t(match)
    })
  end
end

local snippets = {
  -- const 宣告
  s({
    trig = "(.+).const",
    regTrig = true,
    hidden = true,
    snippetType = "autosnippet",
    priority = 2000,
  }, {
    d(1, create_var_snippet("const"))
  }),

  -- let 宣告
  s({
    trig = "(.+).let",
    regTrig = true,
    hidden = true,
    snippetType = "autosnippet",
    priority = 2000,
  }, {
    d(1, create_var_snippet("let"))
  }),

  -- var 宣告
  s({
    trig = "(.+).var",
    regTrig = true,
    hidden = true,
    snippetType = "autosnippet",
    priority = 2000,
  }, {
    d(1, create_var_snippet("var"))
  })
}

return snippets
