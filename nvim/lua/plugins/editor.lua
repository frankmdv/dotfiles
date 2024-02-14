local dirs = require("frankmdv.dirs")

return {
  --[[
    ||FLASH||
    Allows you to move the cursor quickly to words that match a set
    pattern.
  ]]
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
    opts = {
      prompt = {
        prefix = { {"🛸", "FlashPromptIcon"} },
      },
    },
    config = function(_, opts)
      require("flash").setup(opts)

      -- Because some themes (such as onenord) do not yet have flash support, you
      -- must manually apply styling to differentiate the jump tag (letter that
      -- must be clicked to jump to the word) to differentiate it.
      local colors = require("onenord.colors").load()
      vim.api.nvim_set_hl(0, "FlashLabel", { bg = colors.light_gray, fg = colors.white, bold = true})
    end
  },

  --[[
    ||NEO-TREE||
    Provides a file explorer with multiple functions such as search,
    filter, delete, add, etc.
  ]]
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = dirs.get_root_dir() })
        end,
        desc = "File Explorer (root dir)",
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = dirs.get_buf_dir() })
        end,
        desc = "File Explorer (cwd)",
      },
      {
        "<leader>fb",
        function()
          require("neo-tree.command").execute({ source = "buffers", toggle = true })
        end,
        desc = "Buffer Explorer",
      },
    },
    opts = {
      close_if_last_window = true,
      filesystem = {
        follow_current_file = { enabled = true },
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
      event_handlers = {
        {
          event = "file_opened", -- automatically closes neo-tree when opening a new file
          handler = function()
            vim.cmd("Neotree close")
          end,
        },
      },
    },
  },

  --[[
    ||PERSISTENCE||
     Provides the feature to manage work sessions.
  ]]
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- session directory path,
    },
    keys = {
      {
        "<leader>pr",
        function()
          require('persistence').load({ last = true })
        end,
        desc = "Restore last session",
      },
      {
        "<leader>ps",
        function()
          require("persistence").stop()
          vim.notify("Persistence session saving disabled", vim.log.levels.WARN)
        end,
        desc = "Do not save the session",
      },
    },
  },
}
