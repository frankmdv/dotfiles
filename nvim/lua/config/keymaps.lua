local maps = {
	["<Esc>"] = {
		":noh<CR>",
		opts = {
			silent = true,
			desc = "clear highlights search",
		},
	},

	-- windows
	["<C-h>"] = {
		"<C-w>h",
		opts = {
			desc = "move to the left window",
		},
	},
	["<C-j>"] = {
		"<C-w>j",
		opts = {
			desc = "move to the window below",
		},
	},
	["<C-k>"] = {
		"<C-w>k",
		opts = {
			desc = "move to the top window",
		},
	},
	["<C-l>"] = {
		"<C-w>l",
		opts = {
			desc = "move to the rigth window",
		},
	},
	["<leader>wd"] = {
		"<C-W>c",
		opts = {
			desc = "delete window",
		},
	},
	["<leader>wx"] = {
		"<cmd>split<cr>",
		opts = {
			desc = "vertical split",
		},
	},
	["<leader>wy"] = {
		"<cmd>vsplit<cr>",
		opts = {
			desc = "horizontal split",
		},
	},

	-- save/quit
	["<C-s>"] = {
		"<cmd>w<cr>",
		modes = { "n", "i" },
		opts = {
			desc = "save file",
		},
	},
	["<leader>q"] = {
		"<cmd>qa<cr>",
		opts = {
			desc = "quit all",
		},
	},
	["<leader>fq"] = {
		"<cmd>qa!<cr>",
		opts = {
			desc = "force quit all",
		},
	},

	-- buffers
	["<leader>bd"] = {
		"<cmd>bd<cr>",
		opts = {
			silent = true,
			desc = "delete buffer",
		},
	},
	["<tab>"] = {
		"<cmd>bn<cr>",
		opts = {
			silent = true,
			desc = "next buffer",
		},
	},
	["<S-tab>"] = {
		"<cmd>bp<cr>",
		opts = {
			silent = true,
			desc = "prev buffer",
		},
	},

	-- restores forward navigation in the change history
	["<C-i>"] = {
		"<C-i>",
		opts = {
			desc = "forward nav in the jump history",
		}
	},

	-- increment/decrement
	["+"] = {
		"<C-a>",
		opts = {
			desc = "increment a numeric value",
		},
	},
	["-"] = {
		"<C-x>",
		opts = {
			desc = "decrement a numeric value",
		},
	},

  -- command mode
	[";"] = {
		":",
		modes = { "n", "v" },
		opts = {
			desc = "enter to command mode",
		},
	},

	-- lazy
	["<leader>l"] = {
		"<cmd>Lazy<cr>",
		opts = {
			desc = "open lazy ui",
		},
	},

	-- ui
	["<leader>uw"] = {
		(function()
      local notify_record = nil

      return function()
        local wrap_state = vim.api.nvim_command_output("set wrap?")
        local command = "nowrap"
        local state = "disabled"

        if wrap_state == "nowrap" then
          command = "wrap"
          state = "enabled"
        end

        vim.cmd("set " .. command)
        notify_record = vim.notify("Wrap lines " .. state, vim.log.levels.INFO, { replace = notify_record })
      end
		end)(),
		opts = {
			desc = "wrap/nowrap",
		},
	}
}

for m, props in pairs(maps) do
	local modes = props.modes or "n"
	vim.keymap.set(modes, m, props[1], props.opts)
end
