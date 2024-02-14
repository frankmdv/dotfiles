local current_palette_theme = nil

function load_theme_colors(name_theme)
  module_color_themes = {
    onenord = require("onenord.colors").load
  }

  return module_color_themes[name_theme]()
end

local ui_palettes = {
  onenord = function(colors)
    return {
      color0 = colors.light_gray,
      color1 = "#FFFFFF",
      color2 = colors.selection,
      color3 = colors.light_gray,
    }
  end
}

local M = {}

M.set_theme_palette = function(name_theme)
  local theme_colors = load_theme_colors(name_theme)

  current_palette_theme = ui_palettes[name_theme](theme_colors)

  return current_palette_theme
end

M.get_theme_palette = function()
  return current_palette_theme
end

return M
