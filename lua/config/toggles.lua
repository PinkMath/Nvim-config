local M = {}

function M.relative_numbers()
  local enabled = not vim.wo.relativenumber
  vim.opt.number = true
  vim.opt.relativenumber = enabled
  vim.notify("Relative numbers " .. (enabled and "enabled" or "disabled"))
end

function M.transparent_background()
  require("config.theme").toggle_transparent_background()
end

return M
