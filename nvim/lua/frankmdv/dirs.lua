local M = {}

--- Finds the root directory path of a project based on the
-- first parent directory containing the .git directory.
-- @return string or nil: If found, it will return the path
-- to the root directory of the project, otherwise it will 
-- return nil.
M.get_root_dir = function()
  for dir in vim.fs.parents(vim.api.nvim_buf_get_name(0)) do
    if vim.fn.isdirectory(dir .. "/.git") == 1 then
      return dir
    end
  end
end

--- Returns current working path of the active buffer.
-- @return string: current working path of the active buffer.
M.get_buf_dir = function()
  local buffer_path = vim.api.nvim_buf_get_name(0)
  return vim.fs.dirname(buffer_path)
end

return M
