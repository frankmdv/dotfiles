local M = {}

-- Receives as argument a table with the modes and each mode is a table containing keymaps
M.map_modes = function(modes)
	for mode, maps in pairs(modes) do
		for key, command in pairs(maps) do
			local action, opts = command, { noremap = true, silent = true }
			if type(command) == "table" then
				action, opts = command[1], command[2]
			end
			vim.keymap.set(mode, key, action, opts)
		end
	end
end

return M
