local api = vim.api

-- Temporarily highlights text copied to the clipboard.
api.nvim_create_autocmd("TextYankPost", {
	callback = function ()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})
