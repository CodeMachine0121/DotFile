return {
	"telescope.nvim",
	dependencies = {
		"nvim-telescope/telescope-file-browser.nvim",
	},
	keys = {
		{
			"<leader>fP",
			function()
				require("telescope.builtin").find_files({
					cwd = require("lazy.core.config").options.root,
				})
			end,
			desc = "Find Plugin File",
		},
		{
			";f",
			function()
				local builtin = require("telescope.builtin")
				builtin.find_files({
					no_ignore = false,
					hidden = true,
				})
			end,
		},
		{
			";r",
			function()
				local builtin = require("telescope.builtin")
				builtin.live_grep()
			end,
		},
		{
			"\\\\",
			function()
				local builtin = require("telescope.builtin")
				builtin.buffers()
			end,
		},
		{
			";t",
			function()
				local builtin = require("telescope.builtin")
				builtin.help_tags()
			end,
		},
		{
			";;",
			function()
				local builtin = require("telescope.builtin")
				builtin.resume()
			end,
		},
		{
			"zn",
			function()
				local builtin = require("telescope.builtin")
				builtin.diagnostics()
			end,
		},
	},
}
