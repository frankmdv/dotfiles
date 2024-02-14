local require_modules = { "options", "keymaps", "autocmds", "lazy" }

for _, m in ipairs(require_modules) do
	require("config." .. m)
end
