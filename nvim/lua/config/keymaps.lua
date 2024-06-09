local utils = require("frankmdv.utils")

local maps_to_create = {
  -- windows
  ["<leader>wd"] = {
    "<C-W>c",
    opts = {
      desc = "Delete Window",
    },
  },
  ["<leader>wx"] = {
    "<cmd>split<cr>",
    opts = {
      desc = "Vertical Split",
    },
  },
  ["<leader>wy"] = {
    "<cmd>vsplit<cr>",
    opts = {
      desc = "Horizontal Split",
    },
  },

  -- buffers
  ["<tab>"] = {
    "<cmd>bn<cr>",
    opts = {
      desc = "Next Buffer",
    },
  },
  ["<S-tab>"] = {
    "<cmd>bp<cr>",
    opts = {
      desc = "Prev Buffer",
    },
  },

  -- restores forward navigation in the change history
  ["<C-i>"] = {
    "<C-i>",
    opts = {
      desc = "Forward Nav In The Jump History",
    },
  },

  -- increment/decrement
  ["+"] = {
    "<C-a>",
    opts = {
      desc = "Increment Value",
    },
  },
  ["-"] = {
    "<C-x>",
    opts = {
      desc = "Decrement Value",
    },
  },

  -- command mode
  [";"] = {
    ":",
    modes = { "n", "v" },
    opts = {
      desc = "Enter To Command Mode",
    },
  },
}

local maps_to_delete = {
  n = {
    "<leader>w-", -- horizontal window split
    "<leader>-", -- horizontal window split
    "<leader>w|", -- vertical window split
    "<leader>|", -- vertical window split
    "<leader><tab>]", -- next tab
    "<leader><tab>[", -- previous tab
  },
}

utils.create_map(maps_to_create)
utils.delete_map(maps_to_delete)
