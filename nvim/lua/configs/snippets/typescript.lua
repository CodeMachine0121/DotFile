local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

local test_snippets = {
    s("vit", fmt([[
import {{ describe, it, expect }} from 'vitest'

describe('{}', () => {{
  it('{}', () => {{
    {}
  }})
}})]], {
      i(1, "test suite"),
      i(2, "should ..."),
      i(3, "// test here")
    })),

    s("fn", fmt([[
function {}({}: {}) {{
  {}
}}]], {
      i(1, "name"),
      i(2, "params"),
      i(3, "type"),
      i(4, "// implementation")
    })),

    s("afn", fmt([[
const {} = ({}: {}) => {{
  {}
}}]], {
      i(1, "name"),
      i(2, "params"),
      i(3, "type"),
      i(4, "// implementation")
    })),

    -- interface
    s("int", fmt([[
interface {} {{
  {}: {}
}}]], {
      i(1, "Name"),
      i(2, "prop"),
      i(3, "type")
    })),

    -- type
    s("type", fmt([[
type {} = {{
  {}: {}
}}]], {
      i(1, "Name"),
      i(2, "prop"),
      i(3, "type")
    })),

    -- describe block
    s("desc", fmt([[
describe('{}', () => {{
  {}
}})]], {
      i(1, "description"),
      i(2, "// tests")
    })),

    -- it block
    s("it", fmt([[
it('{}', () => {{
  {}
}})]], {
      i(1, "should ..."),
      i(2, "// test")
    })),

    -- async it
    s("ita", fmt([[
it('{}', async () => {{
  {}
}})]], {
      i(1, "should ..."),
      i(2, "// async test")
    })),

    -- expect
    s("exp", fmt([[
expect({}).{}({})]], {
      i(1, "actual"),
      i(2, "toBe"),
      i(3, "expected")
    })),

    -- beforeEach
    s("bef", fmt([[
beforeEach(() => {{
  {}
}})]], {
      i(1, "// setup")
    })),

    -- mock
    s("mock", fmt([[
const {} = vi.fn().mockReturnValue({})]], {
      i(1, "mockFn"),
      i(2, "value")
    })),

    -- async mock
    s("mocka", fmt([[
const {} = vi.fn().mockResolvedValue({})]], {
      i(1, "mockFn"),
      i(2, "value")
    })),

    -- 基本 for 迴圈
    s({
      trig = "for",
      dscr = "For Loop"
    }, fmt([[
  for (let {} = {}; {} < {}; {}++) {{
    {}
  }}]], {
      i(1, "i"),
      i(2, "0"),
      rep(1),
      i(3, "length"),
      rep(1),
      i(4, "// code")
    })),

    -- for of 迴圈 (陣列迭代)
    s({
      trig = "forof",
      dscr = "For Of Loop"
    }, fmt([[
  for (const {} of {}) {{
    {}
  }}]], {
      i(1, "item"),
      i(2, "items"),
      i(3, "// code")
    })),

    -- for in 迴圈 (物件屬性迭代)
    s({
      trig = "forin",
      dscr = "For In Loop"
    }, fmt([[
  for (const {} in {}) {{
    {}
  }}]], {
      i(1, "key"),
      i(2, "object"),
      i(3, "// code")
    })),

    -- forEach 方法
    s({
      trig = "foreach",
      dscr = "forEach Loop"
    }, fmt([[
  {}.forEach(({}) => {{
    {}
  }});]], {
      i(1, "array"),
      i(2, "item"),
      i(3, "// code")
    })),

    -- 帶有 index 的 forEach 方法
    s({
      trig = "foreachi",
      dscr = "forEach Loop with index"
    }, fmt([[
  {}.forEach(({}, {}) => {{
    {}
  }});]], {
      i(1, "array"),
      i(2, "item"),
      i(3, "index"),
      i(4, "// code")
    })),

    -- while 迴圈
    s({
      trig = "while",
      dscr = "While Loop"
    }, fmt([[
  while ({}) {{
    {}
  }}]], {
      i(1, "condition"),
      i(2, "// code")
    })),

    -- do while 迴圈
    s({
      trig = "dowhile",
      dscr = "Do While Loop"
    }, fmt([[
  do {{
    {}
  }} while ({});]], {
      i(1, "// code"),
      i(2, "condition")
    })),

    -- map 方法
    s({
      trig = "map",
      dscr = "Array map method"
    }, fmt([[
  {}.map(({}) => {{
    {}
  }});]], {
      i(1, "array"),
      i(2, "item"),
      i(3, "return item")
    })),

    -- filter 方法
    s({
      trig = "filter",
      dscr = "Array filter method"
    }, fmt([[
  {}.filter(({}) => {{
    {}
  }});]], {
      i(1, "array"),
      i(2, "item"),
      i(3, "return true")
    })),

    -- reduce 方法
    s({
      trig = "reduce",
      dscr = "Array reduce method"
    }, fmt([[
  {}.reduce((acc, {}) => {{
    {}
    return acc;
  }}, {});]], {
      i(1, "array"),
      i(2, "curr"),
      i(3, "// code"),
      i(4, "initialValue")
    })),
}

return test_snippets

