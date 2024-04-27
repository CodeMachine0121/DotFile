-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
-- moves
keymap.set("n", "hh", "^")
keymap.set("n", "ll", "$")

-- edit
keymap.set("n", "z;", "<esc>$a;<esc>", opts)
keymap.set("n", "z,", "<esc>$a,<esc>", opts)

-- tab
keymap.set("n", "<A-n>", ":tabedit<Return>", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sl", "<C-w>l")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sk", "<C-w>k")

-- reload
keymap.set("n", "zso", ":source<Return>")

-- Diagnostics
keymap.set("n", "<f-8", function()
    vim.diagnostic.goto_next()
end, opts)
