local M = {
  -- Change this value to switch to another installed colorscheme.
  colorscheme = "kanagawa",
  transparent = false,
}

local transparent_groups = {
  "Normal",
  "NormalNC",
  "SignColumn",
  "EndOfBuffer",
  "LineNr",
  "CursorLineNr",
  "StatusLine",
  "StatusLineNC",
  "WinSeparator",
  "FloatBorder",
  "NormalFloat",
  "TelescopeNormal",
  "TelescopeBorder",
  "NeoTreeNormal",
  "NeoTreeNormalNC",
  "NvimTreeNormal",
  "NvimTreeNormalNC",
}

local function clear_background(group)
  local ok, highlight = pcall(vim.api.nvim_get_hl, 0, {
    name = group,
    link = false,
  })
  if not ok then
    return
  end

  highlight.bg = nil
  highlight.ctermbg = nil
  vim.api.nvim_set_hl(0, group, highlight)
end

local function apply_transparency()
  for _, group in ipairs(transparent_groups) do
    clear_background(group)
  end
end

function M.apply_colorscheme(colorscheme)
  local name = colorscheme or M.colorscheme
  local ok, error_message = pcall(vim.cmd.colorscheme, name)
  if not ok then
    vim.notify(("Could not load colorscheme %q: %s"):format(name, error_message), vim.log.levels.WARN)
  end
  return ok
end

function M.set_transparent_background(enabled, notify)
  M.transparent = enabled

  if enabled then
    apply_transparency()
  else
    M.apply_colorscheme(vim.g.colors_name or M.colorscheme)
  end

  if notify ~= false then
    vim.notify("Transparent background " .. (enabled and "enabled" or "disabled"))
  end
end

function M.toggle_transparent_background()
  M.set_transparent_background(not M.transparent)
end

function M.setup()
  local group = vim.api.nvim_create_augroup("ThemeConfig", { clear = true })
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = group,
    callback = function()
      if M.transparent then
        apply_transparency()
      end
    end,
  })

  M.apply_colorscheme()
end

return M
