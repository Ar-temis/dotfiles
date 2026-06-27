# Dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

This repo is intended to be cloned directly into the home directory as `~/dotfiles`. From there, Stow creates symlinks from the files in this repo into `$HOME`.

## Included Configs

- Shell: `.zshrc`, `.zshrc_linux`
- Terminal: `ghostty`, `kitty`
- Editor: `nvim`
- File manager: `yazi`
- Tools: `harper-ls`, `opencode`
- Assets: `Pictures`

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
