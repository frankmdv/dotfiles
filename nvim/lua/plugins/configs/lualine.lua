local lualine = require("lualine")

-- Diagnostic icon for lualine
local symbols = vim.g.diagnostic_icons
for type, icon in pairs(symbols) do
	symbols[type] = icon .. " "
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = string.lower,
			},
		},
		lualine_b = { "branch", "diff", {
			"diagnostics",
			symbols = symbols,
		} },
		lualine_c = { "filename" },
		lualine_x = {
			"encoding",
			{
				"fileformat",
				symbols = {
					unix = "unix",
					dos = "win",
					mac = "mac",
				},
			},
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {
		nvim_tree = {
			sections = { lualine_a = { "filetype" } },
			filetypes = { "NvimTree" },
		},
	},
})
