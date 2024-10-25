return function(diagnostics, actions)
    print("Total diagnostics:", #diagnostics)  -- 檢查是否有診斷信息
    
    for _, diagnostic in ipairs(diagnostics) do
        print("Diagnostic source:", diagnostic.source)    -- 檢查診斷來源
        print("Diagnostic code:", diagnostic.code)        -- 檢查診斷代碼
        print("Diagnostic message:", diagnostic.message)  -- 檢查診斷訊息
        print("Diagnostic severity:", diagnostic.severity)-- 檢查診斷嚴重程度
        
        if diagnostic.message:match("Cannot find name") then
          local current_line = vim.api.nvim_win_get_cursor(0)[1]
          
          local className = diagnostic.message:match("'([a-hj-zA-HJ-Z][a-zA-Z0-9]*)'")
          if not className then
            className = diagnostic.message:match('"([a-hj-zA-HJ-Z][a-zA-Z0-9]*)"')
          end
          
          print("Extracted className:", className)  -- 檢查提取的類名
          
          if className then
            local action = {
              title = "Create class " .. className,
              kind = "quickfix",
              edit = {
                changes = {
                  [vim.uri_from_bufnr(0)] = {
                    {
                      range = {
                        start = { line = current_line - 1, character = 0 },
                        ["end"] = { line = current_line - 1, character = 0 }
                      },
                      newText = string.format([[export class %s {
  constructor() {
  }
}

]], className)
                    }
                  }
                }
              }
            }
            table.insert(actions, action)
            print("Action added for:", className)  -- 確認 action 已添加
          end
        end
    end
    
    print("Total actions:", #actions)  -- 檢查最終的 actions 數量
    return actions
end
