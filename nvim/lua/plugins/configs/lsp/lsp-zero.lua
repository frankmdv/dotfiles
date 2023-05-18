local lsp = require("lsp-zero").preset({
	manage_nvim_cmp = {
		set_basic_mappings = false, -- Remove default mappings
	},
})

-- Diagnostic icons are established
local sign_icons = vim.g.diagnostic_icons
for type, icon in pairs(sign_icons) do
	sign_icons[type] = " " .. icon
end

lsp.set_sign_icons(sign_icons)

-- Mason LSP Servers
lsp.ensure_installed({
	"lua_ls",
	"pyright",
	"tsserver",
	"html",
	"jsonls",
	"tailwindcss",
})

lsp.on_attach(function(client, bufnr)
	local keymaps = {
		n = {
			-- ["<Leader>lf"] = function()
			-- 	vim.lsp.buf.format({ async = false, timeout_ms = 2000 }) -- Format file
			-- end,
			["<Leader>lr"] = vim.lsp.buf.rename, -- Rename
			["<Leader>ld"] = vim.diagnostic.open_float, -- Diagnostics in floating window
			["<Leader>li"] = vim.lsp.buf.hover, -- Information about the symbol under the cursor in a floating window
			["<Leader>lp"] = vim.diagnostic.goto_prev, -- Move to the previous diagnostic in the current buffer
			["<Leader>ln"] = vim.diagnostic.goto_next, -- Move to the next diagnostic
			["<Leader>lh"] = vim.lsp.buf.declaration, -- Jumps to the declaration of the symbol under the cursor
			["<Leader>ls"] = vim.lsp.buf.references, -- Lists all the references to the symbol under the cursor in the quickfix window
		},
	}

	require("utils").map_modes(keymaps)
end)

-- Configures the language server for lua with
-- options specifically tailored for Neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

-- Configuration values for formatting a file
local format_conf = {
	timeout_ms = 2000,
	-- Table that sets the language server that
	-- will be used to format a given file type.
	servers = {
		["null-ls"] = {
			"html",
			"css",
			"javascript",
			"typescript",
			"json",
			"python",
			"lua",
		},
	},
}

-- Format with keymap enable
lsp.format_mapping("<Leader>lf", {
	format_opts = {
		async = false,
		timeout_ms = format_conf.timeout_ms,
	},
	servers = format_conf.servers,
})

-- Format on save enable
lsp.format_on_save({
	format_opts = {
		timeout_ms = format_conf.timeout_ms,
	},
	servers = format_conf.servers,
})

-- lsp.set_server_config({
-- 	on_init = function(client)
-- 		-- Disables semantic highlighting on LSP servers
-- 		client.server_capabilities.semanticTokensProvider = nil
-- 	end,
-- })

	lsp.setup()
