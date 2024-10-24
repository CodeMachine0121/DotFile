-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- config attach
local on_attach = function(client, bufnr)
  if client.name == "ts_ls" then
    local orig_code_action = vim.lsp.buf.code_action
    
    vim.lsp.buf.code_action = function(options)
      local params = vim.lsp.util.make_range_params()
      params.context = {
        diagnostics = vim.diagnostic.get(0, {
          lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
        })
      }
      
      -- 先獲取原始的 actions
      client.request('textDocument/codeAction', params, function(err, actions)
        if err then return end
        
        actions = actions or {}
        
        -- 檢查診斷信息
        local diagnostics = params.context.diagnostics
        actions = require('configs.codeActions.ts_create_class')(diagnostics, actions)
        actions = require('configs.codeActions.ts_create_interface')(diagnostics, actions)
        -- 使用 nvchad 的方式顯示 actions
        if #actions > 0 then
          local action_tuple = {}
          for i, action in ipairs(actions) do
            action_tuple[i] = { action.title, action }
          end
          
          vim.ui.select(action_tuple, {
            prompt = 'Code actions:',
            format_item = function(item)
              return item[1]
            end,
          }, function(choice)
            if choice then
              local selected_action = choice[2]
              if selected_action.edit then
                vim.lsp.util.apply_workspace_edit(selected_action.edit, "utf-8")
              end
            end
          end)
        end
      end)
    end
  end
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
lspconfig.ts_ls.setup{
    on_attach = on_attach,
    capabilities = nvlsp.capabilities,
    init_options = {
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
          languages = {"javascript", "typescript", "vue"},
        },
      },
    },
    filetypes = {
      "javascript",
      "typescript",
      "vue",
    },
  }

-- CSS
lspconfig.cssls.setup({
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
})

-- Tailwind
lspconfig.tailwindcss.setup({
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
})

-- HTML
lspconfig.html.setup({
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
})

-- JSON
lspconfig.jsonls.setup({
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
})

-- Eslint
lspconfig.eslint.setup({
  on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
  end,
	capabilities = nvlsp.capabilities,
})

-- Python
lspconfig.pyright.setup({
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
})

