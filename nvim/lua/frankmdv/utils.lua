local M = {}

function M.create_map(maps_to_create)
  for map, props in pairs(maps_to_create) do
    local modes = props.modes or "n"
    vim.keymap.set(modes, map, props[1], props.opts)
  end
end

function M.delete_map(maps_to_delete)
  for mode, maps in pairs(maps_to_delete) do
    for _, m in ipairs(maps) do
      vim.keymap.del(mode, m)
    end
  end
end

return M
