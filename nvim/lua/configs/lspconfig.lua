-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

local function setActionUi(actions)
  if #actions > 0 then
    vim.ui.select(actions, {
      prompt = 'Code actions:',
      format_item = function(action)
        return action.title
      end,
    }, function(action)
      if not action then return end
      
      -- 處理不同類型的 actions
      if action.edit then
        -- 處理帶有 edit 的 action
        vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
      elseif action.command then
        -- 處理帶有 command 的 action
        if type(action.command) == "table" then
          vim.lsp.buf.execute_command(action.command)
        else
          vim.lsp.buf.execute_command(action)
        end
      end
    end)
  end
end


local on_attach = function(client, bufnr)
  print("Now lsp server: " .. client.name)
  if client.name == "ts_ls" then
    client.server_capabilities.codeActionProvider = {
      resolveProvider = true,
      codeActionKinds = {
        "quickfix",
        "refactor",
        "refactor.extract",
        "refactor.inline",
        "refactor.rewrite",
        "source",
        "source.organizeImports",
      }
    }

    -- local orig_code_action = vim.lsp.buf.code_action

    vim.lsp.buf.code_action = function(options)
      local params = vim.lsp.util.make_range_params()
      params.context = {
        diagnostics = vim.diagnostic.get(0, {
          lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
        }),
        -- 明確指定我們支援的 code action 類型
        only = {
          "quickfix",
          "refactor",
          "refactor.extract",
          "source"
        }
      }
      
      client.request('textDocument/codeAction', params, function(err, result)
        if err then return end
        local actions = result or {}
        
        -- 檢查診斷信息
        local diagnostics = params.context.diagnostics
        
        -- 添加自定義 actions
        actions = require('configs.codeActions.ts_create_class')(diagnostics, actions)
        actions = require('configs.codeActions.ts_create_interface')(diagnostics, actions)
        actions = require('configs.codeActions.ts_extract_variable')(actions, bufnr)
        -- 使用 nvchad 的方式顯示 actions
        setActionUi(actions)
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
require('lspconfig').ts_ls.setup({
  on_attach = on_attach,
  capabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), {
    codeActionProvider = {
      resolveProvider = true,
      codeActionKinds = {
        "quickfix",
        "refactor",
        "refactor.extract",
        "refactor.inline",
        "refactor.rewrite",
        "source",
        "source.organizeImports",
      }
    }
  }),
  init_options = {
    preferences = {
      provideRefactorNotApplicableReason = true,
      allowIncompleteCompletions = true,
    }
  },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true
      }
    }
  }
})


-- CSS
lspconfig.cssls.setup({
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
})

-- Tailwind
-- lspconfig.tailwindcss.setup({
-- 	on_attach = nvlsp.on_attach,
-- 	capabilities = nvlsp.capabilities,
-- })

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

