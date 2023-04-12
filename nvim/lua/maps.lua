vim.g.mapleader = " " -- Key for customized maps

local keymaps = {
	n = {
		-- Editor
		["<Esc>"] = ":noh<CR>", -- Clear highlights
		["<C-h>"] = "<C-w>h", -- Move right
		["<C-j>"] = "<C-w>j", -- Move down
		["<C-k>"] = "<C-w>k", -- Move up
		["<C-l>"] = "<C-w>l", -- Move left
		["sh"] = ":split<CR><C-w>j", -- Horizontal split
		["sv"] = ":vsplit<CR><C-w>l", -- Vertical split
		["<Leader>w"] = ":w<CR>", -- Overwrite buffer
		["<Leader>q"] = ":q<CR>", -- Window exit
		["<Leader>fq"] = ":q!<CR>", -- Forced window exit
		["<Leader>bd"] = ":bd<CR>", -- Delete buffer
		["<Tab>"] = ":bn<CR>", -- Next buffer
		["<S-Tab>"] = ":bp<CR>", -- Previous buffer
		["<C-i>"] = "<C-i>", -- Restores forward navigation in the change history
		["+"] = "<C-a>", -- Increment
		["-"] = "<C-x>", -- Decrement
		[";"] = { ":", { noremap = true } }, -- Enter to command mode
		-- NvimTree
		["<Leader>nt"] = ":NvimTreeToggle<CR>", -- Toggle File Explorer
		-- Hop
		["<Leader>s"] = ":HopChar2<CR>", -- Jump to character string
		-- Telescope
		["<Leader>ff"] = ":Telescope find_files<CR>", -- File search
		["<Leader>fg"] = ":Telescope live_grep<CR>", -- String search
		["<Leader>fb"] = ":Telescope buffers<CR>", -- Buffer search
		-- NvimComment
		["<Leader>/"] = ":CommentToggle<CR>", -- Toggle comment
	},
	v = {
		-- Editor
		[";"] = { ":", { noremap = true } }, -- Enter to command mode
		-- NvimComment
		["<Leader>/"] = ":CommentToggle<CR>", -- Toggle comment
	},
}

require("utils").map_modes(keymaps)
