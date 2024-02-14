local M = {}

--[[
  Returns the path to the root directory of a project
  based on the parent folder containing the .git directory.

  @return (string) path to the root directory of a project
]]
M.get_root_dir = function()
  for dir in vim.fs.parents(vim.api.nvim_buf_get_name(0)) do
    if vim.fn.isdirectory(dir .. "/.git") == 1 then
      return dir
    end
  end
end

--[[
  Return current working path of the active buffer.

  @return (string) current working path
]]
M.get_buf_dir = function()
  local buffer_path = vim.api.nvim_buf_get_name(0)
  return vim.fs.dirname(buffer_path)
end

return M
