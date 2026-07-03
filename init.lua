-- Minimal Fullstack PinkMath Neovim config

local data_dir = vim.fn.stdpath("data")
local autoload_dir = vim.fs.joinpath(data_dir, "site", "autoload")
local plug_path = vim.fs.joinpath(autoload_dir, "plug.vim")
local uv = vim.uv or vim.loop

local function install_vim_plug()
  if vim.fn.executable("git") ~= 1 then
    vim.notify("vim-plug is missing and Git is not available", vim.log.levels.ERROR)
    return false
  end

  local clone_dir = vim.fn.tempname()
  local result = vim.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--depth",
    "1",
    "https://github.com/junegunn/vim-plug.git",
    clone_dir,
  }, { text = true }):wait()

  if result.code ~= 0 then
    vim.notify("Could not install vim-plug:\n" .. (result.stderr or ""), vim.log.levels.ERROR)
    return false
  end

  vim.fn.mkdir(autoload_dir, "p")
  local copied, copy_error = uv.fs_copyfile(vim.fs.joinpath(clone_dir, "plug.vim"), plug_path)
  vim.fn.delete(clone_dir, "rf")

  if not copied then
    vim.notify("Could not install vim-plug: " .. tostring(copy_error), vim.log.levels.ERROR)
    return false
  end

  return true
end

local installed_vim_plug = false
if not uv.fs_stat(plug_path) then
  installed_vim_plug = install_vim_plug()
  if not installed_vim_plug then
    return
  end
end

vim.loader.enable()

local Plug = vim.fn["plug#"]

vim.call("plug#begin")

-- Core
Plug("nvim-lua/plenary.nvim")

-- Fuzzy finder
Plug("ibhagwan/fzf-lua")

-- Syntax highlighting
Plug("nvim-treesitter/nvim-treesitter")

-- Git
Plug("lewis6991/gitsigns.nvim")

-- Harpoon
Plug("ThePrimeagen/harpoon", { ["branch"] = "harpoon2" })

-- Formatting
Plug("stevearc/conform.nvim")

-- Auto pairs
Plug("windwp/nvim-autopairs")

-- LSP
Plug("neovim/nvim-lspconfig")
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")

-- Completion
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")

-- Theme | Color preview
Plug("rebelot/kanagawa.nvim")
Plug("brenoprata10/nvim-highlight-colors")

-- image.nvim is optional and does not currently support native Windows.
if vim.fn.has("win32") == 0 then
  Plug("3rd/image.nvim", {
    ["for"] = { "markdown", "vimwiki", "norg", "typst", "html", "css", "asciidoc", "rst" },
  })
end

vim.call("plug#end")

if installed_vim_plug then
  vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
      vim.cmd("PlugInstall --sync")
      vim.cmd("source " .. vim.fn.fnameescape(vim.fs.joinpath(vim.fn.stdpath("config"), "init.lua")))
    end,
  })
end

require("config.options")
require("config.mappings")
require("config.autocmd")

require("plugins.kanagawa")
require("config.theme").setup()
require("plugins.conform")
require("plugins.autopairs")
require("plugins.fzf-lua")
require("plugins.treesitter")
require("plugins.gitsigns")
require("plugins.harpoon")
require("plugins.lsp")
require("plugins.highlightcolors")
require("plugins.image")
