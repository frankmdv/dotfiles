local opt = vim.opt
local g = vim.g

g.mapleader = " " -- Key for customized maps
opt.number = true -- Activates sidebar with line numbers
opt.relativenumber = true -- The line numbers become relative to the current line
opt.cursorline = true -- Activates the cursor line
opt.termguicolors = true -- Enables 24-bit color format (RGB or RGBA)
opt.wrap = false -- No wrap lines
opt.showmode = false -- Disables neovim's default display of modes
opt.shiftwidth = 0 -- Sets the value of the TAB key spaces (At 0 it takes the value of tabstop)
opt.tabstop = 2 -- Interprets that each tab character is equivalent to two spaces
opt.clipboard = "unnamedplus" -- Allows synchronization with the operating system clipboard
-- opt.autowriteall = true -- Saves automatically when exiting the buffer
-- opt.autowrite = true
opt.ignorecase = true -- Ignore uppercase and lowercase letters when searching
opt.smartcase = true -- Case-sensitive when search pattern contains capital letters
opt.smartindent = true -- Sets indents automatically
opt.undofile = true -- The changes made are tracked so that it is possible to undo and redo the contents of the file
opt.undolevels = 10000 -- Maximum number of changes that Neovim will remember to undo or redo
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.list = true -- Show some invisible characters (tabs...
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.expandtab = true -- Use spaces instead of tabs
opt.spelllang = { "en", "es" } -- Language of the spelling dictionary used to check spelling in Vim
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
