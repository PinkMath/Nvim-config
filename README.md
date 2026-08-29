# ☁️ Loavy's Neovim Config

A clean, minimal, and aesthetic Neovim (0.11+) configuration. Built for speed and simplicity across Windows and Linux. 

Powered by `vim-plug`, Kanagawa, Treesitter, native LSP, `fzf-lua`, and a carefully curated selection of plugins to keep your workflow fast and distraction-free.

## 🎀 Prerequisites

- **Neovim** 0.11 or newer
- **Git**
- A TrueColor supported terminal
- A **Nerd Font** (JetBrainsMono, CaskaydiaCove, or FiraCode recommended)
- `ripgrep` & `fzf` (for lightning-fast searches)
- A C compiler (for Treesitter parsers)

*Note: Language servers and formatters have their own runtimes (e.g., Node.js).*

## 🚀 Installation

*(Remember to back up your existing config before cloning!)*

**Linux / macOS:**
```sh
git clone [https://github.com/loavy/nvim](https://github.com/loavy/nvim) ~/.config/nvim
nvim
```

**Windows (PowerShell):**
```powershell
git clone [https://github.com/loavy/nvim](https://github.com/loavy/nvim) $env:LOCALAPPDATA\nvim
nvim
```

*Plugins will automatically install on the first launch. If interrupted, simply run `:PlugInstall` and restart Neovim.*

## 🎨 Theme & UI

This config uses the beautiful **Kanagawa Wave** colorscheme by default. 
- Change the theme name anytime in `lua/config/theme.lua`.
- Relative line numbers are enabled by default (current line is absolute).

| Keymap | Action |
|---|---|
| `<leader>nn` | Toggle relative line numbers |
| `<leader>bb` | Toggle transparent background |

## ⌨️ Keymaps

The leader key is set to **Space**.

| Keymap | Action |
|---|---|
| `<leader>w` | Save file |
| `<leader>f` | Find files |
| `<leader>g` | Live grep |
| `<leader>b` | Find buffers |
| `<leader>a` | Add file to Harpoon |
| `<leader>h` | Open Harpoon menu |
| `<leader>u` | Open URL/path under cursor |
| `<leader>=` or `=` | Format current file |
| `<leader>P` | Install plugins |
| `<leader>U` | Update plugins |

**LSP specific:** `gd`, `gD`, `gr`, `gi`, `K`, `<leader>rn`, `<leader>ca`, `<leader>d`, `[d`, `]d`.

## 🛠️ LSP & Mason Setup

Open `:Mason` in Neovim to manage your language servers. Based on this configuration, install the following packages using their exact Mason codes:

```text
bash-language-server
css-lsp
docker-compose-language-service
dockerfile-language-server
emmet-language-server
html-lsp
intelephense
json-lsp
lua-language-server
pyright
rust-analyzer
tailwindcss-language-server
typescript-language-server
yaml-language-server
```
*After installation, restart Neovim and run `:checkhealth vim.lsp` to verify.*

## 🖼️ Optional Image Previews

`3rd/image.nvim` is lazy-loaded for supported document filetypes. 
- Requires **ImageMagick** and a terminal with graphics protocol support (like **Kitty**, Ghostty, or WezTerm). 
- Not supported natively on Windows (works via WSL). If you don't have the requirements, Neovim will still start up perfectly fine without it.

## 📂 Structure

```text
nvim/
├── init.lua
└── lua/
    ├── config/      # Core settings, keymaps, and options
    └── plugins/     # Individual plugin configurations
```
*No hardcoded paths. Opening URLs uses Neovim's native cross-platform `vim.ui.open()`.*

## ✨ Handy Commands

- `:PlugInstall` / `:PlugUpdate` / `:PlugClean`
- `:TSUpdate` (Update Treesitter parsers)
- `:Mason` (Manage LSPs and formatters)
- `:checkhealth` (Troubleshoot your setup)
