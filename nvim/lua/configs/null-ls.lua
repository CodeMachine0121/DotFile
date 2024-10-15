local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local function get_fun_predicate(node, params)
    if node == nil or node:type() ~= "identifier" then return false end
    local parent = node:parent()
    if parent == nil or parent:type() ~= "function_definition" then return false end

    local node_text = vim.treesitter.get_node_text(node, params["bufnr"])
    if node_text:match("^get") == nil then return false end

    return true
end

local fmt = null_ls.builtins.formatting
local dgn = null_ls.builtins.diagnostics
local cda = null_ls.builtins.code_actions


null_ls.register({
  name = "eslint",
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "css", "scss", "json", "yaml" },

  generator = {
    fn = function(params)
      local out = {}

      local node = vim.treesitter.get_node()
      if get_fun_predicate(node, params) then
        table.insert(out,
        {
          title = 'test',
          action = function()
            vim.fn.append(params["row"]-1, "# OMG")
          end
        })
      end
      return out
    end,
  },
  sources = {

    -- Formatting
    fmt.prettierd,

    -- Diagnostics
    dgn.write_good,
    dgn.markdownlint,

    -- Code Actions
    cda.gitsigns,

    -- eslint_d
    require("none-ls.diagnostics.eslint_d")
  },

  on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
