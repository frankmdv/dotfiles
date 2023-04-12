local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
	ensure_installed = {
		"python",
		"javascript",
		"lua",
		"markdown",
		"html",
		"json",
		"css",
	},
	highlight = { enable = true },
})
