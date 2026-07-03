if vim.fn.has("win32") == 1 then
  return
end

local configured = false
local unavailable = false

local function supports_kitty_graphics()
  if vim.env.KITTY_WINDOW_ID or vim.env.WEZTERM_PANE then
    return true
  end

  local terminal = ((vim.env.TERM or "") .. " " .. (vim.env.TERM_PROGRAM or "")):lower()
  return terminal:find("kitty", 1, true)
    or terminal:find("wezterm", 1, true)
    or terminal:find("ghostty", 1, true)
end

local function has_imagemagick()
  return vim.fn.executable("magick") == 1
    or (vim.fn.executable("convert") == 1 and vim.fn.executable("identify") == 1)
end

local function setup()
  if configured or unavailable or not supports_kitty_graphics() then
    return
  end

  if not has_imagemagick() then
    unavailable = true
    vim.notify_once("Image previews are unavailable: install ImageMagick", vim.log.levels.INFO)
    return
  end

  local ok, image = pcall(require, "image")
  if not ok then
    return
  end

  local setup_ok, error_message = pcall(image.setup, {
    backend = "kitty",
    processor = "magick_cli",
    integrations = {
      markdown = {
        enabled = true,
        download_remote_images = false,
        only_render_image_at_cursor = false,
        floating_windows = false,
        filetypes = { "markdown", "vimwiki" },
      },
      neorg = { enabled = true },
      typst = { enabled = true },
      html = { enabled = true },
      css = { enabled = true },
    },
    max_height_window_percentage = 50,
    window_overlap_clear_enabled = true,
  })

  if setup_ok then
    configured = true
  else
    unavailable = true
    vim.notify_once("Image previews could not be enabled: " .. tostring(error_message), vim.log.levels.WARN)
  end
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("OptionalImagePreviews", { clear = true }),
  pattern = { "markdown", "vimwiki", "norg", "typst", "html", "css", "asciidoc", "rst" },
  callback = setup,
})
