# Dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

This repo is intended to be cloned directly into the home directory as `~/dotfiles`. From there, Stow creates symlinks from the files in this repo into `$HOME`.

## Included Configs

- Shell: `.zshrc`, `.zshrc_linux`
- Terminal: `ghostty`, `kitty`
- Editor: `nvim`
- File manager: `yazi`
- Window manager: `hypr`
- Multiplexer: `tmux`
- Omarchy: `omarchy/shell.json` (bar layout, idle timers), `omarchy/shell.toml`
  (font size), `omarchy/defaults/agent`, `omarchy/themes/mytheme`
- Tools: `harper-ls`, `opencode`
- Assets: `Pictures`

Omarchy files that are deliberately *not* tracked: anything under
`~/.local/state/omarchy/` (machine state, rewritten by `omarchy theme set`),
the stock `.sample` hooks and `extensions/omarchy-menu.jsonc` (shipped by the
omarchy package), and hooks installed by omarchy migrations such as
`hooks/post-update.d/setup-agent.hook`.

## Install

Install GNU Stow if it is not already available:

```sh
sudo pacman -S stow
```

Clone this repo into your home directory:

```sh
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
```

Create symlinks into your home directory:

```sh
stow .
```

## Updating

Pull the latest changes, then re-run Stow:

```sh
cd ~/dotfiles
git pull
stow .
```

## Uninstall

Remove the symlinks created by Stow:

```sh
cd ~/dotfiles
stow -D .
```

## Handling Conflicts

If Stow reports that a file already exists, move or back up the existing file first. For example:

```sh
mv ~/.zshrc ~/.zshrc.backup
stow .
```

Use `stow --adopt .` only if you intentionally want to move existing files from `$HOME` into this repo.
