-- This module contains plugins that provide new features, functions and
-- visual aspects to the Neovim graphical interface.

return {
  -- Provides a color scheme that modifies both the neovim
  -- graphical interface and the syntax highlighting colors of programming
  -- languages.
  {
   "rmehri01/onenord.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      local colors = require("onenord.colors").load()

      local opts = {
        theme = "dark",
        styles = {
          diagnostics = "NONE",
        },
        disable = {
          background = true,
        },
        custom_highlights = {
          dark = {
            -- overwrites the display format of some of the visual elements
            -- of the editor.
            CursorLine = { bg = colors.selection },
            IncSearch = { fg = colors.yellow, bg = colors.light_gray, style = "bold" },
          }
        },
        -- custom theme colores are added
        custom_colors = {
          white = "#FFFFFF",
        }
      }

      return opts
    end,
  },

  -- Adds a status bar that displays useful information such as publisher
  -- status, Git version control data, or custom information according to
  -- the developer's needs.
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local opts = {
        options = {
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = function(mode)
                local sub = string.sub
                return sub(mode, 2, 2) == "-" and sub(mode, 3, 3) or sub(mode, 1, 1)
              end
            },
          },
          lualine_x = {
            {
              "filetype",
              icon_only = true,
              padding = { right = 1 }
            },
            "encoding",
            {
              "fileformat",
              symbols = {
                unix = "unix",
                dos = "win",
                mac = "mac"
              }
            },
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        extensions = { "neo-tree", "mason", "lazy" },
      }
      return opts
    end
  },

  -- Provides a top bar that allows you to view and manage the buffers
  -- open in the current Neovim session.
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {
      options = {
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "center",
          },
        },
        always_show_bufferline = true,
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)

      -- Fixes hidden bufferline when opening a new file
      -- via dashboard.
      vim.api.nvim_create_autocmd("BufAdd", {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end
      })
    end
  },

  -- Change and enrich user interface components such as messages or
  -- notifications, the command line and pop-up menus.

  -- ¡THIS PLUGIN IS STILL IN CONFIGURATION!
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>m", "<cmd>Noice<cr>", desc = "Open message history" },
    },
    opts = {
      -- INVESTIGATE WHAT IT IS USED FOR WHEN THE PLUGIN THAT ACTIVATES
      -- THE LSP IS CORRECTLY CONFIGURED.
      --[[
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      ]]
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
  },

  --[[
    ||NVIM-NOTIFY||
  ]]
  {
    "rcarriga/nvim-notify",
    lazy = true,
    opts = function()
      local opts = {
        render = "compact",
        stages = "fade",
        timeout = 3000,
      }

      return opts
    end,
  },

  --[[
    ||DASHBOARD||
  ]]
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

      logo = string.rep("\n", 6) .. logo .. string.rep("\n", 2)
      local opts = {
        theme = "doom",
        config = {
          header = vim.split(logo, "\n"),
          center = {
            {
              action = "Telescope find_files",
              desc = " Find file",
              icon = " ",
              key = "f"
            },
            {
              action = "ene | startinsert",
              desc = " New file",
              icon = " ",
              key = "n"
            },
            {
              action = "Telescope live_grep",
              desc = " Find text",
              icon = " ",
              key = "g"
            },
            {
              action = 'lua require("persistence").load()',
              desc = " Restore Session",
              icon = " ",
              key = "r"
            },
            {
              action = "Lazy",
              desc = " Lazy",
              icon = "󰒲 ",
              key = "l"
            },
            {
              action = "qa",
              desc = " Quit",
              icon = " ",
              key = "q"
            },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
            return {
              string.format(
                "🛸 Neovim loaded %i/%i plugins in %dms",
                stats.loaded,
                stats.count,
                ms
              )
            }
          end,
        }
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      return opts
    end,
  },
}
