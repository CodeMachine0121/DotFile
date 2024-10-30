
local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
  "vue",
}

local dap = require("dap")

-- 自定義 DapStoppedLine 的顏色，設定為 Visual 模式相同的顏色
vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

-- 手動設置 DAP 圖標
local dap_icons = {
  Breakpoint = { "🛑", "DiagnosticInfo" },
  Stopped = { "🔵", "DiagnosticWarn" },
  -- 添加更多圖標配置
}
for name, sign in pairs(dap_icons) do
  vim.fn.sign_define(
    "Dap" .. name,
    { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
  )
end

-- JavaScript/TypeScript 的 DAP 配置
for _, language in ipairs(js_based_languages) do
  dap.configurations[language] = {
    -- Debug 單個 Node.js 文件
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
    },
    -- Debug Node.js 過程（請確保執行過程時添加 --inspect）
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
    },
    {
      name = "Launch TypeScript file",
      type = "pwa-node",
      request = "launch",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      runtimeExecutable = "ts-node",
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
      skipFiles = { "<node_internals>/**" },
    },

    -- vue debug
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Vue Dev Server",
      program = "${workspaceFolder}/node_modules/vite/bin/vite.js", -- Vue CLI 服務器位置
      args = { "serve" }, -- 等同於 `npm run dev`
      cwd = "${workspaceFolder}",
      runtimeExecutable = "node", -- 使用 Node.js 來啟動
      console = "integratedTerminal", -- 終端輸出設置
      sourceMaps = true,
      protocol = "inspector",
      port = function ()
        local co = coroutine.running()
        return coroutine.create(function()
          vim.ui.input({
            prompt = "Enter Port: ",
            default = "3000",
          }, function(port)
            if port == nil or port == "" then
              return
            else
              coroutine.resume(co, port)
            end
          end)
        end)
      end , -- 調試端口
    },

    -- Debug web applications (client side)
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Launch & Debug Chrome",
      url = function()
        local co = coroutine.running()
        return coroutine.create(function()
          vim.ui.input({
            prompt = "Enter URL: ",
            default = "http://localhost:3000",
          }, function(url)
            if url == nil or url == "" then
              return
            else
              coroutine.resume(co, url)
            end
          end)
        end)
      end,
      webRoot = vim.fn.getcwd(),
      protocol = "inspector",
      sourceMaps = true,
      userDataDir = false,
    },
    -- Divider for the launch.json derived configs
    {
      name = "----- ↓ launch.json configs ↓ -----",
      type = "",
      request = "launch",
    },

}
end
