local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = true
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- Save & Quit
map("n", "<leader>w",
    "<CMD>call VSCodeNotify('workbench.action.files.save')<CR>")
map("n", "<leader>q",
    "<CMD>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- Windows
map("n", "<leader>vs",
    "<CMD>call VSCodeNotify('workbench.action.splitEditorRight')<CR>")
map("n", "<leader>vp",
    "<CMD>call VSCodeNotify('workbench.action.splitEditorDown')<CR>")

-- File Explorer
map("n", "<leader>e", "<CMD>call VSCodeNotify('workbench.view.explorer')<CR>")

-- Buffer navigation
map("n", "gt", "<CMD>call VSCodeNotify('workbench.action.nextEditor')<CR>")
map("n", "gT", "<CMD>call VSCodeNotify('workbench.action.previousEditor')<CR>")
map("n", "gw",
    "<CMD>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>")

-- Window Navigation
map("n", "<C-h>", "<CMD>call VSCodeNotify('workbench.action.navigateLeft')<CR>")
map("n", "<C-l>", "<CMD>call VSCodeNotify('workbench.action.navigateRight')<CR>")
map("n", "<C-k>", "<CMD>call VSCodeNotify('workbench.action.navigateUp')<CR>")
map("n", "<C-j>", "<CMD>call VSCodeNotify('workbench.action.navigateDown')<CR>")

-- Editor
map("n", "z;", "a;")
map("n", "z,", "a,")
map("n", "z.", "a.")
map("n", "<tab>", ">>_")
map("v", "<tab>", ">gv")
map("n", "<s-tab>", "<<_")
map("v", "<s-tab>", "<gv")
map("n", "hh", "^")
map("n", "ll", "$")

-- Move
map("n", "gb", "<C-o>")
map("n", "gB", "<C-i>")

-- LSP 相關
map("n", "gd", "<CMD>call VSCodeNotify('editor.action.revealDefinition')<CR>")
map("n", "gD", "<CMD>call VSCodeNotify('editor.action.peekDefinition')<CR>")
map("n", "gr", "<CMD>call VSCodeNotify('editor.action.goToReferences')<CR>")
map("n", "gi", "<CMD>call VSCodeNotify('editor.action.goToImplementation')<CR>")
map("n", "<leader>rn", "<CMD>call VSCodeNotify('editor.action.rename')<CR>")
map("n", "<leader>fm",
    "<CMD>call VSCodeNotify('editor.action.formatDocument')<CR>")
map("n", "<leader>ca", "<CMD>call VSCodeNotify('editor.action.quickFix')<CR>")
map("n", "K", "<CMD>call VSCodeNotify('editor.action.showHover')<CR>")

-- Git
map("n", "<leader>gt", "<CMD>call VSCodeNotify('workbench.scm.focus')<CR>")

map('n', '<leader>ff',
    "<cmd>call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')<CR>")
