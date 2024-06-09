return {
  -- Provides a color scheme that modifies both the neovim
  -- graphical interface and the syntax highlighting colors of
  -- programming languages.
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
            CursorLine = { bg = colors.highlight },
            IncSearch = { fg = colors.yellow, bg = colors.light_gray, style = "bold" },
          },
        },
        -- custom theme colors are added
        custom_colors = {
          white = "#FFFFFF",
        },
      }

      return opts
    end,
  },

  -- Adds a status bar that displays useful information such as publisher
  -- status, Git version control data, or custom information according to
  -- the developer's needs.
  {
    "nvim-lualine/lualine.nvim",
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
              end,
            },
          },
          lualine_b = { "branch" },
          lualine_x = {
            {
              "filetype",
              padding = { right = 1 },
            },
            "encoding",
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        extensions = { "neo-tree", "mason", "lazy" },
      }
      return opts
    end,
  },

  -- Adds a top bar that displays information about the buffers being used in the
  -- current Neovim session and allows interacting with them, making it possible
  -- to select or close open buffers.
  {
    "akinsho/bufferline.nvim",
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
  },
}
