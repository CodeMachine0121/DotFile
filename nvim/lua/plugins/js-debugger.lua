local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
  "vue",
}

return {
  { "nvim-neotest/nvim-nio" },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("configs.nvim-dap")
    end,
    keys = {
      -- 設置鍵綁定
      {'<F5>', function() require('dap').continue() end, desc = "Next Breakpoint"},
      { "<leader>dO", function() require("dap").step_out() end, desc = "Step Out" },
      { "<F10>", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>da", function()
          if vim.fn.filereadable(".vscode/launch.json") then
            local dap_vscode = require("dap.ext.vscode")
            dap_vscode.load_launchjs(nil, {
              ["pwa-node"] = js_based_languages,
              ["chrome"] = js_based_languages,
              ["pwa-chrome"] = js_based_languages,
            })
          end
          require("dap").continue()
        end, desc = "Run with Args" },
      { "<leader>dt", function() require("dap").toggle_breakpoint() end, desc = "Add/Remove Breakpoint" },
    },
    dependencies = {
      -- 安裝 vscode-js-debug 調試適配器
      {
        "microsoft/vscode-js-debug",
        build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
        version = "1.*",
      },
      {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
          require("configs.nvim-dap-vscode")
        end,
      },
      {
        "Joakker/lua-json5",
        build = "./install.sh",
      },
    },
  },
}

