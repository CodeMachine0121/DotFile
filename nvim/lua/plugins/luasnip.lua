return {
	"L3MON4D3/LuaSnip",
	build = (not LazyVim.is_win())
			and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
		or nil,
	dependencies = {
		{
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		{
			"L3MON4D3/LuaSnip",
			opts = function(_, opts)
				local ls = require("luasnip")
				local snip = ls.snippet
				local node = ls.snippet_node
				local text = ls.text_node
				local insert = ls.insert_node
				local func = ls.function_node
				local date = function()
					return { os.date("%Y-%m-%d") }
				end

				ls.add_snippets(nil, {
					cs = {
						snip({
							trig = "test",
							namr = "test",
							dscr = "test function template",
						}, {
							text({ "[Test]", "public void " }), -- 使用 t() 來生成靜態文本
							insert(1, "TestMethod"), -- 使用 i() 定義一個可編輯的區域，這裡是方法名
							text({ "()", "{", "    // Arrange", "", "    // Act", "", "    // Assert", "", "}" }),
						}),
					},
				})

				ls.add_snippets(nil, {
					all = {
						snip({
							trig = "date",
							namr = "Date",
							dscr = "Custom date in the form of YYYY-MM-DD",
						}, { func(date, {}) }),
					},
				})
			end,
		},
		{
			"nvim-cmp",
			dependencies = {
				"saadparwaiz1/cmp_luasnip",
			},
			opts = function(_, opts)
				opts.snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				}
				table.insert(opts.sources, { name = "luasnip" })
			end,
		},
	},
	opts = {
		history = true,
		delete_check_events = "TextChanged",
	},
  -- stylua: ignore
  keys = {
    {
      "<tab>",
      function()
        return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
      end,
      expr = true, silent = true, mode = "i",
    },
    { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
    { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
  },
}
