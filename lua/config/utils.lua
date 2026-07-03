local M = {}

function M.open_under_cursor()
  local target = vim.fn.expand("<cfile>")
  if target == "" then
    vim.notify("No path or URL under cursor", vim.log.levels.WARN)
    return
  end

  local ok, _, error_message = pcall(vim.ui.open, target)
  if not ok or error_message then
    vim.notify("Could not open " .. target, vim.log.levels.WARN)
  end
end

return M
