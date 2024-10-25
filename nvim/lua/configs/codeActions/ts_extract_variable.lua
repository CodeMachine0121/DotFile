local function ts_extract_variable(actions, bufnr)
  local current_line = vim.api.nvim_get_current_line()
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1
  
  -- 找到等號後面的內容
  local value = current_line:match("=%s*(.+)$")
  if not value then
    return actions
  end

  local extract_action = {
    title = "Extract to variable",
    kind = "refactor.extract",
    edit = {
      changes = {
        [vim.uri_from_bufnr(bufnr)] = {
          {
            -- 先插入新的 const 宣告
            range = {
              start = { line = row, character = 0 },
              ["end"] = { line = row, character = 0 }
            },
            newText = "const extracted = " .. value .. "\n"
          },
          {
            -- 直接將原本的賦值改為使用 extracted
            range = {
              start = { line = row, character = 0 },
              ["end"] = { line = row + 1, character = 0 }
            },
            newText = current_line:match("(.-)=") .. "= extracted\n"
          }
        }
      }
    }
  }

  table.insert(actions, extract_action)
  return actions
end

return ts_extract_variable
