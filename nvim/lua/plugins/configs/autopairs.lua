local autopairs = require("nvim-autopairs")

autopairs.setup({
	check_ts = true, -- Activates treesitter support for better accuracy
	ignored_next_char = "[%w%.]", -- Will not match if the next character is alphanumeric or the . symbol
	disable_filetype = { "TelescopePrompt" },
})
