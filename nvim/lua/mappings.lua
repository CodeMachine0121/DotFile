require "nvchad.mappings"

-- add yours here
local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

local status, telescope = pcall(require, "telescope.builtin")
if status then
	-- Telescope
	map("n", "<leader>ff", telescope.find_files)
	map("n", "<leader>fg", telescope.live_grep)
	map("n", "<leader>fb", telescope.buffers)
	map("n", "<leader>fh", telescope.help_tags)
	map("n", "<leader>fs", telescope.git_status)
	map("n", "<leader>fc", telescope.git_commits)
else
	print("Telescope not found")
end

-- <leader> = the space key

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q!", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- Windows
map("n", "<leader>vs", "<CMD>vsplit<CR>")
map("n", "<leader>vp", "<CMD>split<CR>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>o", "<CMD>Neotree focus<CR>")

-- Buffer
map("n", "gt", "<CMD>bnext<CR>")
map("n", "gT", "<CMD>bprevious<CR>")

-- Terminal
map("n", "<leader>th", "<CMD>ToggleTerm size=10 direction=horizontal<CR>")
map("n", "<leader>tv", "<CMD>ToggleTerm size=80 direction=vertical<CR>")

-- Markdown Preview
--map("n", "<leader>m", "<CMD>MarkdownPreview<CR>")
map("n", "<leader>mn", "<CMD>MarkdownPreviewToggle<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- editor
map("n", "z;", "A;")
map("n", "z,", "A,")
map("n", "z.", "A.")
map("n", "<Tab>", ">>_")
map("v", "<Tab>", ">gv")
map("n", "hh", "^")
map("n", "ll", "$")
map("n", "<leader>so", "<CMD>source<CR>")
map("n", "<C-w>", "<Plug>(expand_region_expand)")
map("v", "<C-w>", "<Plug>(expand_region_expand)")



-- move
map("n", "gb",  "<C-o>")
map("n", "gB",  "<C-i>")
map("n", "<leader>g", "<Plug>(easymotion-s)")


-- Refactor
map("x", "M", "<CMD>lua require('refactoring').refactor('Extract Function')<CR>")
map("x", "<leader>rv", "<CMD>lua require('refactoring').refactor('Extract Variable')<CR>")
map("x", "<leader>rp", "<CMD>lua require('refactoring').refactor('Extract Parameter')<CR>")
map("x", "<leader>ri", "<CMD>lua require('refactoring').refactor('Inline Variable')<CR>")
map("x", "<leader>rf", "<CMD>lua require('refactoring').refactor('Extract Block To File')<CR>")
map("x", "<leader>rr", "<CMD>lua require('refactoring').select_refactor()<CR>")

-- Lsp
map("n", "gd", '<CMD>Glance type_definitions<CR>')
map("n", "gD", '<CMD>Glance definitions<CR>')
map("n", "gr", '<CMD>Glance references<CR>')
map("n", "gi", '<CMD>Glance implementations<CR>')
-- map("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>")
-- map("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>")
-- map("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>")
-- map("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>")
map("n", "<leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>fm", "<CMD>lua vim.lsp.buf.format()<CR>")
map("n", "<leader>ca", "<CMD>lua vim.lsp.buf.code_action()<CR>")
map("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>")

map("n", "<leader>a", '<cmd>lua require("fastaction").code_action()<CR>')
map("v", "<leader>a", "<esc><cmd>lua require('fastaction').range_code_action()<CR>")

-- Trouble
map("n", "<leader>xx", "<CMD>Trouble<CR>")
map("n", "<leader>xw", "<CMD>Trouble workspace_diagnostics<CR>")
map("n", "<leader>xd", "<CMD>Trouble document_diagnostics<CR>")
map("n", "<leader>xl", "<CMD>Trouble loclist<CR>")
map("n", "<leader>xq", "<CMD>Trouble quickfix<CR>")
map("n", "gR", "<CMD>Trouble lsp_references<CR>")
