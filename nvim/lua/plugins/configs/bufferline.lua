local bufferline = require("bufferline")

bufferline.setup({
	options = {
		always_show_bufferline = true,
		offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } },
	},
})
