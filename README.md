<div align="center">
  <p>
      <img alt="Linux" src="https://img.shields.io/badge/Linux-%23.svg?style=flat-square&logo=linux&color=FCC624&logoColor=black" />
      <img alt="macOS" src="https://img.shields.io/badge/macOS-%23.svg?style=flat-square&logo=apple&color=000000&logoColor=white" />
      <img alt="Windows" src="https://img.shields.io/badge/Windows-%23.svg?style=flat-square&logo=windows&color=0078D6&logoColor=white" />
  <p>
<div>

<div align="left">

# 🍞 Bread's Neovim Configuration

A fast, modern Neovim setup optimized for **programming in Lua, JavaScript/TypeScript, React, Python, C/C++, CSS, HTML**, and more. Includes LSP, autocompletion, snippets, fuzzy finding, and aesthetic themes.

---

## ⚡ Features

- **LSP & Autocompletion**
  - Powered by `nvim-lspconfig` and `mason.nvim`
  - Servers included: `lua_ls`, `ts_ls` (JS/TS/React/Node), `pyright`, `clangd`, `cssls`, `html`, `tailwindcss`
  - Auto-completion with `nvim-cmp` + snippets (`LuaSnip`)
  - Keymaps for go-to-definition, hover, rename, and code actions

- **Themes & Appearance**
  - Supports multiple color schemes: `catppuccin`, `gruvbox`, `pywal16`
  - Statusline with `lualine.nvim`  
  - Pretty icons with `nvim-web-devicons`
  - Color highlights via `nvim-colorizer.lua`

- **Productivity Tools**
  - File navigation and fuzzy finder: `fzf-lua`
  - Git integration: `gitsigns.nvim`
  - Harpoon for quick file navigation
  - Commenting: `Comment.nvim`
  - Auto-pairs for brackets/quotes: `nvim-autopairs`
  - Floating terminal: `FTerm.nvim`
  - Markdown preview inline: `render-markdown.nvim`
  - CSV viewer: `decisive.nvim`
  - Twilight plugin for focusing on code blocks

- **Editing Enhancements**
  - Treesitter-powered syntax highlighting
  - Async linting with `nvim-lint`
  - Which-key popup for keymap hints

---

## 🛠 Installation

### Requirements
- Neovim ≥ 0.9
- Git
- Patched font with Nerd Font glyph support
- Terminal that supports TrueColor and glyphs

### Install

1. Clone this repository:

```bash
cd ~/.config/ https://github.com/PinkMath/Nvim-config.git
```

2. Install fzf:

```bash
# Download with your package
sudo apt install fzf
```

3. Open Neovim:
```bash
nvim
```

4. Plugins will automatically install on first startup via `vim-plug`.
> If doesn't run `:PlugInstall`.

### 📝 LSP Configuration

- Managed automatically with mason.nvim and mason-lspconfig.

- Lua, JS/TS, React, Python, C/C++, CSS, HTML, and Tailwind CSS are preconfigured.

- Keymaps (in normal mode):

    - gd → Go to definition

    - K → Hover documentation

    - gi → Go to implementation

    - <leader>rn → Rename symbol

    - <leader>ca → Code actions

### 🎨 Themes

Switch themes in `lua/config/theme.lua`:

- solarized-osaka
- catppuccin
- gruvbox
- pywal16


### 🚀 Productivity & Navigation

- Fuzzy finder: `<leader>f` (via `fzf-lua`)

- Harpoon quick navigation: `<leader>h`

- Git signs inline: added via `gitsigns.nvim`

- Floating terminal: `<leader>t`

- Treesitter for syntax highlighting and text objects

- Twilight for dimming inactive code blocks

### 📂 File Structure

```Plain
~/.config/nvim/
├─ init.lua              # main entry
├─ lua/
│  ├─ config/
│  │  ├─ options.lua     # Neovim options
│  │  ├─ mappings.lua    # Keymaps
│  │  ├─ theme.lua       # Theme loader
│  │  └─ autocmd.lua     # Autocommands
│  └─ plugins/
│     ├─ lsp.lua         # LSP & completion setup
│     ├─ fzf-lua.lua     # FZF config
│     ├─ lualine.lua     # Statusline
│     ├─ comment.lua     # Comment.nvim
│     └─ ...             # Other plugin configs
└─ README.md             # This file
```

### 🔧 Tips

- Ensure your terminal supports patched Nerd Fonts for icons.
- Optional: Use `pywal16` for automatic theme based on wallpaper colors.
- LSP servers will be installed automatically via Mason.

### 📌 Notes

- Defered loading is used for non-essential plugins to reduce startup time.
- Keymaps, LSP, and autocompletion are fully functional out-of-the-box.
- Future-proof with `vim.lsp.config` style setup for LSP servers (Neovim ≥ 0.11).

### 💖 Credits

- Inspired by [@ThePrimeagen](https://github.com/ThePrimeagen) and other modern Neovim configs. Arch BTW.
- I used [@BreadOnPenguins](https://github.com/BreadOnPenguins) as base to create the config. Thank you Bread :).
- I also took some ideas from [@Takuya Matsuyama](https://github.com/craftzdog), to make the code clean. I like your videos <3.

<div>
