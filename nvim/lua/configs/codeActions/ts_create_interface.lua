return function(diagnostics, actions)
    for _, diagnostic in ipairs(diagnostics) do
        local className = diagnostic.message:match("Cannot find name 'I([A-Z][a-zA-Z0-9]*)'")
        if className then
          -- 添加我們的自定義 action
          table.insert(actions, {
            title = "Create interface I" .. className,
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

export interface I%s {

}
                    ]], className)
                  }
                }
              }
            }
          })

          table.insert(actions, {
            title = "Create type I" .. className,
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

export type I%s = {

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
