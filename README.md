# dotfiles

Personal dotfiles for `zsh`, `oh-my-zsh`, `ghostty`, and `nvim`.

The repo currently contains:

- `.zshrc` for shell setup
- `ghostty/config` for terminal configuration
- `nvim/` for a LazyVim-based Neovim setup

## Environment

This repo is primarily set up for macOS.

The `ghostty` config includes macOS-specific settings such as `macos-window-shadow`, `macos-titlebar-style`, and `macos-titlebar-proxy-icon`, so Linux users will likely need to adjust that file before using it.

## Prerequisites

Install these before linking the configs:

- `git`
- `zsh`
- `Homebrew`
- `Neovim`
- `Ghostty`
- `Oh My Zsh`
- `Spaceship` prompt theme for Oh My Zsh, or change `ZSH_THEME="spaceship"` in `.zshrc`
- `Mononoki Nerd Font` for the Ghostty font setting

The shell config also assumes these tools are available:

- `eza` for the `ls` and `ld` aliases
- `aws` CLI because the Oh My Zsh `aws` plugin is enabled
- `terraform` because the Oh My Zsh `terraform` plugin is enabled and `tf=terraform` is aliased
- `zsh-autosuggestions`
- `zsh-syntax-highlighting`
- Rust installed with Cargo, because `.zshrc` sources `"$HOME/.cargo/env"`

Optional but recommended:

- `lazygit` for the Neovim `<leader>lg` mapping
- `terraform-ls` support in Neovim is configured through `nvim-lspconfig`; if Mason does not install it automatically in your environment, install it manually
- C compiler / command line build tools for Treesitter parser installs

## Shell Setup

This repo expects `zsh` to be managed through `oh-my-zsh`.

The included [.zshrc](/Users/ayx106463/Desktop/playground/dotfiles/.zshrc) assumes:

- `Oh My Zsh` is installed at `~/.oh-my-zsh`
- the active theme is `spaceship`
- the enabled plugins are `git`, `aws`, and `terraform`
- Homebrew-installed `zsh-autosuggestions` and `zsh-syntax-highlighting` are available

If you use `oh-my-zsh` with a different install path, theme, or plugin set, update `.zshrc` before sourcing it.

## Setup

Clone the repo:

```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
```

Back up any existing configs you want to keep:

```bash
mv ~/.zshrc ~/.zshrc.backup 2>/dev/null
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null
mv ~/.config/ghostty ~/.config/ghostty.backup 2>/dev/null
```

Create the target config directories:

```bash
mkdir -p ~/.config/ghostty
```

Link the files from this repo:

```bash
ln -sfn ~/dotfiles/.zshrc ~/.zshrc
ln -sfn ~/dotfiles/nvim ~/.config/nvim
ln -sfn ~/dotfiles/ghostty/config ~/.config/ghostty/config
```

Reload the shell:

```bash
source ~/.zshrc
```

## Neovim First Run

This Neovim config bootstraps `lazy.nvim` automatically on first launch by cloning it from GitHub, so you need internet access the first time you open `nvim`.

Start Neovim once:

```bash
nvim
```

On first launch, LazyVim will install plugins and Treesitter parsers. This config also enables:

- `gruvbox` as the colorscheme
- `terraform` and `hcl` Treesitter parsers
- `terraformls` through `nvim-lspconfig`
- `lazygit.nvim` with `<leader>lg`

## Notes

- If `zsh` fails on startup, the usual causes will be missing `Oh My Zsh`, missing `Spaceship`, missing Homebrew packages, or a missing Cargo environment file.
- If you do not use AWS or Terraform locally, you can remove those plugins from `.zshrc` to avoid unnecessary shell plugin loading.
- If Ghostty shows missing icons or odd glyphs, install the Nerd Font configured in `ghostty/config`.
