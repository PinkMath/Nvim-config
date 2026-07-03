vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, {
    noremap = true,
    silent = true,
    desc = desc,
  })
end

local toggles = require("config.toggles")
local utils = require("config.utils")

-- Basic
map("n", "<leader>w", ":w<CR>", "Save file")
map("n", "<Esc>", ":nohlsearch<CR>")
map({ "n", "v" }, "<C-d>", "<C-d>zz")
map({ "n", "v" }, "<C-u>", "<C-u>zz")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "J", "mzJ`z")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-a>", "ggVG")

-- UI toggles
map("n", "<leader>nn", toggles.relative_numbers, "Toggle relative numbers")
map("n", "<leader>bb", toggles.transparent_background, "Toggle transparent background")

-- FZF
map("n", "<leader>f", function()
  require("fzf-lua").files()
end, "Find files")

map("n", "<leader>g", function()
  require("fzf-lua").live_grep()
end, "Live grep")

map("n", "<leader>b", function()
  require("fzf-lua").buffers()
end, "Find buffers")

-- LSP
map("n", "gd", vim.lsp.buf.definition, "Go to definition")
map("n", "K", vim.lsp.buf.hover, "Hover documentation")
map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
map("n", "<leader>d", vim.diagnostic.open_float, "Show diagnostic")

-- window
map("n", "ss", "<C-w>s") --window - split horizontal
map("n", "sv", "<C-w>v") --window - split vertical
map("n", "sh", "<C-w>h") --window - go to left
map("n", "sj", "<C-w>j") --window - go to down
map("n", "sk", "<C-w>k") --window - go to up
map("n", "sl", "<C-w>l") --window - go to right

-- misc
map("n", "<leader>P", ":PlugInstall<CR>", "Install plugins")
map("n", "<leader>U", ":PlugUpdate<CR>", "Update plugins")
map("n", "<leader>R", ":source %<CR>", "Reload current Lua file")
map("n", "<leader>u", utils.open_under_cursor, "Open path or URL")
map("n", "<leader>pv", ":Ex<CR>", "Open file browser")
map("n", "<leader>S", ":%s//g<Left><Left>", "Replace in file")
