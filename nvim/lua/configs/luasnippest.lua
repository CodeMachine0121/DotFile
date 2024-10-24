local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node

-- basic
ls.config.set_config({
  history = true, -- 开启历史记录
  updateevents = "TextChanged,TextChangedI", -- 实时更新
  enable_autosnippets = true,
  ext_opts = {
    [require("luasnip.util.types").choiceNode] = {
      active = {
        virt_text = { { "●", "GruvboxOrange" } },
      },
    },
  },
})
-- 定义一些基础代码片段
ls.add_snippets("all", {
  -- 日期片段
  s("date", {
    f(function() return os.date("%Y-%m-%d") end, {}),
  }),
  
  -- 时间片段
  s("time", {
    f(function() return os.date("%H:%M:%S") end, {}),
  }),
})

-- 在 custom/configs/luasnip.lua 中添加：
local typescript_snippets = require("configs.snippets.typescript")
local lua_snippets = require("configs.snippets.lua")
local variable_snippets = require("configs.snippets.varaible")
local if_else_snippets = require("configs.snippets.if-else")

ls.add_snippets("typescript", typescript_snippets)
ls.add_snippets("typescript", variable_snippets)
ls.add_snippets("typescript", if_else_snippets)
ls.add_snippets("lua", lua_snippets)
return ls
