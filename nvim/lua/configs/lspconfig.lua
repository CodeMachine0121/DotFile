-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

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
    on_attach = nvlsp.on_attach,
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

