local modules = { "options", "keymaps", "autocmds", "lazy" }

for _, m in ipairs(modules) do
	require("config." .. m)
end
