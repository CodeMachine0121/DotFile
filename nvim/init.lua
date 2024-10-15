require("settings")
require("maps")
--require("plugins/*")

local function load_plugins()
	local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"
	for _, file in ipairs(vim.fn.readdir(plugins_dir)) do
		if file:match("%.lua$") then
			local plugin = file:gsub("%.lua$", "")
			require("plugins." .. plugin)
		end
	end
end

load_plugins()

local themeStatus, kanagawa = pcall(require, "onedark")

if themeStatus then
	vim.cmd("colorscheme onedark")
else
	return
end
