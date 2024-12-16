return function(actions, bufnr)
  local current_line = vim.api.nvim_get_current_line()
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1
  
  -- 匹配 const/let/var 宣告
  local name, value = current_line:match("%s*const%s+(%w+)%s*=%s*(.+)$")
  if not name then
    -- 如果不是 const，試試 let 或 var
    name, value = current_line:match("%s*[let|var]%s+(%w+)%s*=%s*(.+)$")
  end
  
  if name and value then
    -- 找到類別的開始位置
    local class_start = row
    for i = row, 0, -1 do
      local line = vim.api.nvim_buf_get_lines(0, i, i + 1, false)[1]
      if line:match("class%s+%w+") then
        class_start = i + 1  -- 類別宣告的下一行
        break
      end
    end
    
    local extract_action = {
      title = "Extract to class field",
      kind = "refactor.extract",
      edit = {
        changes = {
          [vim.uri_from_bufnr(bufnr)] = {
            {
              -- 在類別開始處插入欄位
              range = {
                start = { line = class_start, character = 0 },
                ["end"] = { line = class_start, character = 0 }
              },
              newText = string.format("  %s = %s;\n", name, value)
            },
            {
              -- 移除原始宣告
              range = {
                start = { line = row, character = 0 },
                ["end"] = { line = row + 1, character = 0 }
              },
              newText = ""
            }
          }
        }
      }
    }
    
    table.insert(actions, extract_action)
  end
  
  return actions
end
