# Loavy Neovim Config

A clean, minimal Neovim 0.11+ configuration for Windows and Linux. It uses
vim-plug, Kanagawa, Treesitter, LSP, completion, `fzf-lua`, Gitsigns, Harpoon,
Conform, and optional image previews.

## Requirements

Required:

- Neovim 0.11 or newer
- Git
- A terminal with TrueColor support
- A Nerd Font (recommended for the best icon coverage)
- [ripgrep](https://github.com/BurntSushi/ripgrep) for live grep
- [fzf](https://github.com/junegunn/fzf) for `fzf-lua`
- A C compiler when a Treesitter parser needs to be built

Language servers and formatters have their own runtimes. For example, many web
development tools require Node.js and npm.

The vim-plug bootstrap uses Git directly and does not assume that `curl`,
`wget`, Bash, or other Unix tools are installed.

## Installation

Back up an existing config before cloning.

### Linux

```sh
git clone https://github.com/loavy/nvim ~/.config/nvim
nvim
```

### Windows

From PowerShell:

```powershell
git clone https://github.com/loavy/nvim $env:LOCALAPPDATA\nvim
nvim
```

Plugins install automatically on the first start. If an installation was
interrupted, run `:PlugInstall` and restart Neovim.

## Fonts and icons

Set the font in your terminal emulator, not in Neovim. Good choices include:

- JetBrainsMono Nerd Font
- CaskaydiaCove Nerd Font
- FiraCode Nerd Font
- Hack Nerd Font

The config does not hardcode a GUI font. Its core signs use plain characters,
so editing remains readable when a Nerd Font is unavailable.

## Theme and UI toggles

Kanagawa Wave is the default colorscheme. It has strong support for Treesitter,
LSP diagnostics, completion menus, fuzzy-finder windows, and common plugin
highlight groups.

The colorscheme name is defined in one place:
`lua/config/theme.lua`. Install a replacement theme and change the
`colorscheme` value there to switch.

Relative numbers are enabled by default. The current line remains absolute,
while other lines are relative. Transparency is disabled by default.

| Keymap | Action |
|---|---|
| `<leader>nn` | Toggle relative line numbers |
| `<leader>bb` | Toggle transparent backgrounds |

Transparency is reapplied after `:colorscheme` changes. Turning it off reloads
the active colorscheme to restore its normal backgrounds.

## Main keymaps

The leader key is Space.

| Keymap | Action |
|---|---|
| `<leader>w` | Save |
| `<leader>f` | Find files |
| `<leader>g` | Live grep |
| `<leader>b` | Find buffers |
| `<leader>a` | Add the current file to Harpoon |
| `<leader>h` | Open the Harpoon menu |
| `<leader>u` | Open the path or URL under the cursor |
| `<leader>=` or `=` | Format the current file |
| `<leader>P` | Install plugins |
| `<leader>U` | Update plugins |

LSP buffer keymaps include `gd`, `gD`, `gr`, `gi`, `K`, `<leader>rn`,
`<leader>ca`, `<leader>d`, `[d`, and `]d`.

## Optional image previews

[`3rd/image.nvim`](https://github.com/3rd/image.nvim) is lazy-loaded only for
supported document filetypes. Remote image downloads are disabled.

To enable previews, install ImageMagick and use a terminal that implements the
Kitty graphics protocol. Kitty provides the best support; WezTerm and Ghostty
may also work. Tmux requires its graphics passthrough settings to be enabled.

Native Windows is skipped because image.nvim currently relies on Unix terminal
size APIs. The rest of the config works normally on Windows, and image previews
can be used from WSL with a compatible terminal. Missing ImageMagick or terminal
graphics support never prevents Neovim from starting.

## LSP setup

Open `:Mason` and install only the servers you need. The config enables:

```text
lua_ls
ts_ls
html
cssls
tailwindcss
emmet_language_server
jsonls
pyright
gopls
rust_analyzer
intelephense
bashls
dockerls
docker_compose_language_service
yamlls
```

After installation, restart Neovim and run:

```vim
:checkhealth vim.lsp
```

## Structure

```text
nvim/
|-- init.lua
|-- lua/
|   |-- config/
|   |   |-- autocmd.lua
|   |   |-- mappings.lua
|   |   |-- options.lua
|   |   |-- theme.lua
|   |   |-- toggles.lua
|   |   `-- utils.lua
|   `-- plugins/
|       |-- image.lua
|       |-- kanagawa.lua
|       `-- ...
`-- README.md
```

All paths are derived from Neovim's standard paths. The config does not contain
hardcoded Windows or Linux home directories, and opening URLs uses Neovim's
cross-platform `vim.ui.open()`.

## Useful commands

```vim
:PlugInstall
:PlugUpdate
:PlugClean
:TSUpdate
:Mason
:checkhealth
```
