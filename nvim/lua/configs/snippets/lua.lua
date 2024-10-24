local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local lua_snippets =  {
  -- 基础函数定义
  s("fn", fmt(
    "function {}({})\n  {}\nend",
    { i(1, "name"), i(2, "args"), i(3, "-- TODO") }
  )),

  -- 局部函数定义
  s("lfn", fmt(
    "local function {}({})\n  {}\nend",
    { i(1, "name"), i(2, "args"), i(3, "-- TODO") }
  )),
  
  -- 局部变量定义
  s("local", fmt(
    "local {} = {}",
    { i(1, "name"), i(2, "value") }
  )),
  
  -- 条件语句
  s("if", fmt(
    "if {} then\n  {}\nend",
    { i(1, "condition"), i(2, "-- TODO") }
  )),
  
  -- if-else 语句
  s("ife", fmt(
    "if {} then\n  {}\nelse\n  {}\nend",
    { i(1, "condition"), i(2, "-- TODO"), i(3, "-- TODO") }
  )),
  
  -- for 循环
  s("for", fmt(
    "for {} = {}, {} do\n  {}\nend",
    { i(1, "i"), i(2, "1"), i(3, "10"), i(4, "-- TODO") }
  )),
  
  -- foreach 循环
  s("forp", fmt(
    "for {}, {} in pairs({}) do\n  {}\nend",
    { i(1, "k"), i(2, "v"), i(3, "table"), i(4, "-- TODO") }
  )),
  
  -- ipairs 循环
  s("fori", fmt(
    "for {}, {} in ipairs({}) do\n  {}\nend",
    { i(1, "i"), i(2, "v"), i(3, "table"), i(4, "-- TODO") }
  )),
  
  -- while 循环
  s("while", fmt(
    "while {} do\n  {}\nend",
    { i(1, "condition"), i(2, "-- TODO") }
  )),
  
  -- 表定义
  s("table", fmt(
    "local {} = {{\n  {}\n}}",
    { i(1, "tbl"), i(2) }
  )),
  
  -- require 语句
  s("req", fmt(
    'local {} = require("{}")',
    { i(1, "module"), i(2, "module_name") }
  )),
  
  -- 模块定义
  s("mod", fmt(
    [[
local {} = {{}}

{}

return {}
    ]], 
    { i(1, "M"), i(2, "-- TODO"), rep(1) }
  )),
  
  -- 打印调试
  s("print", fmt(
    'print("{}: " .. vim.inspect({}))',
    { i(1, "debug"), i(2, "value") }
  )),
  
  -- 注释块
  s("---", fmt(
    [[
---{}
---@param {} {}
---@return {}
    ]],
    { i(1, "Function description"), i(2, "param_name"), i(3, "param_type"), i(4, "return_type") }
  )),
}

return lua_snippets
