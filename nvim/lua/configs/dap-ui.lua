local dap, dapui = require("dap"), require("dapui")

-- 當調試開始時自動打開 DAP UI
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

-- 當調試結束時自動關閉 DAP UI
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- DAP UI 的設置
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "●" },
  mappings = { 
    -- 在這裡自定義 DAP UI 的鍵綁定
    expand = { "<CR>", "<2-LeftMouse>" }, 
    edit = "o",
    remove = "d",
    clear = "c",
  },
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },   -- 構建的變數範圍
        { id = "breakpoints", size = 0.25 },  -- 斷點列表
        { id = "stacks", size = 0.25 },   -- 調用堆疊
        { id = "watches", size = 0.25 },  -- 觀察變數
      },
      size = 40,  -- 總的寬度
      position = "left",  -- 垂直佈局位置
    },
    {
      elements = {
        { id = "repl", size = 0.5 },      -- REPL 視窗
        { id = "console", size = 0.5 },   -- 輸出控制台
      },
      size = 10,  -- 總的高度
      position = "bottom",  -- 水平佈局位置
    },
  },
  floating = {
    max_height = nil, -- 最大高度
    max_width = nil,  -- 最大寬度
    border = "rounded", -- 邊框樣式
  },
})
