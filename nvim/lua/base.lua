local opt = vim.opt
local g = vim.g

-- The integrated netrw plugin that may cause conflicts with nvim-tree is disabled
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Diagnostic icons
g.diagnostic_icons = { error = "✘", warn = "▲", hint = "⚑", info = "»" }

-- Neovim options

opt.number = true -- Activates sidebar with line numbers
opt.relativenumber = true -- The line numbers become relative to the current line
opt.cursorline = true -- Activates the cursor line
opt.termguicolors = true -- Enables 24-bit color format (RGB or RGBA)
opt.wrap = false -- No wrap lines
opt.showmode = false -- Disables neovim's default display of modes
opt.shiftwidth = 0 -- Sets the value of the TAB key spaces (At 0 it takes the value of tabstop).
opt.tabstop = 2 -- Interprets that each tab character is equivalent to two spaces
opt.clipboard = "unnamedplus" -- Allows synchronization with the operating system clipboard
opt.signcolumn = "yes" -- A column is generated for the diagnostic symbols in the sidebar
-- opt.undofile = true

-- Theme
local theme_status, tokyonight = pcall(require, "tokyonight")
if not theme_status then
	return
end

tokyonight.setup({
	transparent = true,
})

vim.cmd([[colorscheme tokyonight-moon]])
