local trouble = require("trouble")

trouble.setup({
        position = "bottom", -- 位置
        height = 10, -- 高度
        width = 50, -- 寬度
        use_diagnostic_signs = true,
        mode = "workspace_diagnostics", -- 默認模式
        fold_open = "", -- 圖標
        fold_closed = "", -- 圖標
        group = true, -- 群組診斷
        padding = true, -- 添加內邊距
        action_keys = { -- 快捷鍵設定
          close = "q", -- 關閉 trouble 視窗
          cancel = "<esc>", -- 取消
          refresh = "r", -- 刷新
          jump = {"<cr>", "<tab>"}, -- 跳轉到問題位置
          open_split = { "<c-x>" }, -- 在分割視窗中打開
          open_vsplit = { "<c-v>" }, -- 在垂直分割視窗中打開
          open_tab = { "<c-t>" }, -- 在新標籤中打開
          jump_close = {"o"}, -- 跳轉並關閉
          toggle_mode = "m", -- 切換模式
          switch_severity = "s", -- 切換嚴重程度
          toggle_preview = "P", -- 切換預覽
          hover = "K", -- 顯示懸浮提示
          preview = "p", -- 預覽
          close_folds = {"zM", "zm"}, -- 關閉所有摺疊
          open_folds = {"zR", "zr"}, -- 打開所有摺疊
          toggle_fold = {"zA", "za"}, -- 切換摺疊
          previous = "k", -- 上一個項目
          next = "j" -- 下一個項目
        },
        signs = {
          -- 圖標設定
          error = "",
          warning = "",
          hint = "",
          information = "",
          other = "﫠"
        },
})
