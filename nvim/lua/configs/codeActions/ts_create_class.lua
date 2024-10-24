return function(diagnostics, actions)
    for _, diagnostic in ipairs(diagnostics) do
        local className = diagnostic.message:match("Cannot find name '([a-hj-zA-HJ-Z][a-zA-Z0-9]*)'")
        if className then
          -- 添加我們的自定義 action
          table.insert(actions, {
            title = "Create class " .. className,
            kind = "quickfix",
            edit = {
              changes = {
                [vim.uri_from_bufnr(0)] = {
                  {
                    range = {
                      start = { line = vim.fn.line('$'), character = 0 },
                      ["end"] = { line = vim.fn.line('$'), character = 0 }
                    },

                    newText = string.format([[

export class %s {
  constructor() {

  }
}
                    ]], className)
                  }
                }
              }
            }
          })
        end
    end

    return actions
end
