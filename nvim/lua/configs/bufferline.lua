local bufferline = require("bufferline")

bufferline.setup({
      options = {
        mode = "buffers", -- 設置為 "buffers" 模式
        numbers = "none",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        
        -- LSP 診斷指示器設置
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        
        -- 自定義顯示設置
        separator_style = "thin",
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        
        -- 游標懸停時顯示緩衝區編號
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        
        -- 設置指示器
        indicator = {
          icon = '▎', -- this should be omitted if indicator style is not 'icon'
          style = 'icon',
        },
         -- buffer 標籤樣式
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = 'X',
        left_trunc_marker = '',
        right_trunc_marker = '',

         -- 客製化顯示
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        
        -- 緩衝區過濾器
        custom_filter = function(buf_number, buf_numbers)
          -- 過濾掉特定的緩衝區，比如說 quickfix 列表
          local excluded_ft = { "qf", "fugitive", "git" }
          local buf_ft = vim.bo[buf_number].filetype
          if vim.tbl_contains(excluded_ft, buf_ft) then
            return false
          end
          return true
        end,
        
        -- 懸停時的提示
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
        },
        
        -- 排序策略
        sort_by = 'insert_after_current'
      },
      
      -- 配色方案
      highlights = {
        -- buffer 被選中時的樣式
        buffer_selected = {
          fg = '#ffffff',
          bold = true,
          italic = false,
        },
        
        -- 分隔符樣式
        separator = {
          fg = '#073642',
          bg = '#002b36',
        },
        separator_selected = {
          fg = '#073642',
        },
        background = {
          fg = '#657b83',
          bg = '#002b36'
        },
        
        -- 修改過的 buffer 樣式
        modified = {
          fg = '#b58900',
        },
        modified_selected = {
          fg = '#b58900',
        },
        
        -- 診斷樣式
        diagnostic = {
          fg = '#268bd2',
        },
        diagnostic_selected = {
          fg = '#268bd2',
          bold = true,
          italic = false,
        },
        
        -- 錯誤樣式
        error = {
          fg = '#dc322f',
        },
        error_selected = {
          fg = '#dc322f',
          bold = true,
          italic = false,
        },
        
        -- 警告樣式
        warning = {
          fg = '#cb4b16',
        },
        warning_selected = {
          fg = '#cb4b16',
          bold = true,
          italic = false,
        },
        
        -- 提示樣式
        hint = {
          fg = '#2aa198',
        },
        hint_selected = {
          fg = '#2aa198',
          bold = true,
          italic = false,
        },
      }
})
