local M = {}
local keymap = vim.keymap

function M.create_map(maps_to_create)
  for map, props in pairs(maps_to_create) do
    local modes = props.modes or "n"
    keymap.set(modes, map, props[1], props.opts)
  end
end

-- Cambiar el código para que se identifique si el comando
-- que se está eliminando existe, sino, entonces no lo elimine.
function M.delete_map(maps_to_delete)
  for mode, maps in pairs(maps_to_delete) do
    for _, m in ipairs(maps) do
      keymap.del(mode, m)
    end
  end
end

return M
