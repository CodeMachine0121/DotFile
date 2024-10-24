local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
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
}

return test_snippets

