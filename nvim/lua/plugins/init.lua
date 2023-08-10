local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- Themes
	use("Mofiqul/dracula.nvim")
	use("EdenEast/nightfox.nvim")
	use("folke/tokyonight.nvim")

	-- Dependencies
	use("nvim-tree/nvim-web-devicons")
	use("nvim-lua/plenary.nvim")

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.configs.autopairs")
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("plugins.configs.colorizer")
		end,
	})

	use({
		"terrortylor/nvim-comment",
		config = function()
			require("plugins.configs.comment")
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.configs.lualine")
		end,
	})

	use({
		"akinsho/bufferline.nvim",
		tag = "v3.*",
		config = function()
			require("plugins.configs.bufferline")
		end,
	})

	use({
		"nvim-tree/nvim-tree.lua",
		tag = "nightly",
		config = function()
			require("nvim-tree").setup()
		end,
	})

	use({
		"phaazon/hop.nvim",
		branch = "v2",
		config = function()
			require("plugins.configs.hop")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		config = function()
			require("plugins.configs.treesitter")
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		config = function()
			require("plugins.configs.telescope")
		end,
	})

	-- LSP
	use("neovim/nvim-lspconfig")

	-- LSP servers manager
	use({
		"williamboman/mason.nvim",
		config = function()
			require("plugins.configs.lsp.mason")
		end,
	})
	use("williamboman/mason-lspconfig.nvim")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- LSP-zero
	use({
		"VonHeikemen/lsp-zero.nvim", -- Branch on which you get updates

		branch = "v2.x",
		config = function()
			require("plugins.configs.lsp.lsp-zero")
		end,
	})

	-- Autocompletion
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.configs.lsp.cmp")
		end,
	})
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lua")

	-- null-ls
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.configs.lsp.null-ls")
		end,
	})

	-- null-ls tools manager
	use({
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.configs.lsp.mason-null-ls")
		end,
	})
end)
