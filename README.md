# dotfiles (GNU Stow)

Manage your dotfiles with symlinks created by `stow`.

## How this repo is organized

Each top-level folder is a Stow package.

General pattern:

```text
<package>/.config/<app>/...  ->  ~/.config/<app>/...
```

Example:

```text
waybar/.config/waybar/config.jsonc  ->  ~/.config/waybar/config.jsonc
```

## Basic commands

Show available flags:

```bash
stow --help
```

Dry run (preview without changes):

```bash
cd ~/dotfiles && stow -n -v -t ~ waybar
```

Apply one package:

```bash
cd ~/dotfiles && stow -t ~ waybar
```

Remove one package:

```bash
cd ~/dotfiles && stow -D -t ~ waybar
```

Apply all packages:

```bash
cd ~/dotfiles && stow -t ~ */
```

Re-stow a package (relink/update symlinks):

```bash
cd ~/dotfiles && stow -R -t ~ waybar
```

Adopt existing files into a package:

```bash
cd ~/dotfiles && stow --adopt -t ~ waybar
```

Check if a managed file is still a symlink:

```bash
ls -la ~/.config/waybar/config.jsonc
```

## Common scenarios

### 1) After a system/app update

Some updates may replace files in `~/.config/` with regular files. If that happens, re-adopt and re-stow.

```bash
cd ~/dotfiles
stow --adopt -t ~ waybar
git diff
stow -t ~ waybar
```

### 2) After editing a managed file

Changes are already in this repo (because the file is a symlink). Just review and commit.

```bash
cd ~/dotfiles
git diff
git add -A && git commit -m "update waybar config"
```

### 3) After adding a new file

Put the new file in the package structure, then stow/adopt.

```bash
mkdir -p ~/dotfiles/waybar/.config/waybar
cp ~/.config/waybar/new-module.jsonc ~/dotfiles/waybar/.config/waybar/new-module.jsonc
cd ~/dotfiles && stow --adopt -t ~ waybar
```

### 4) After adding a new package

Create the package folder with the target structure and stow it.

```bash
mkdir -p ~/dotfiles/mako/.config/mako
cp ~/.config/mako/config ~/dotfiles/mako/.config/mako/config
cd ~/dotfiles && stow --adopt -t ~ mako
```

### 5) After removing a file

Unstow, remove the source file from the package, then stow again.

```bash
cd ~/dotfiles
stow -D -t ~ waybar
rm ~/dotfiles/waybar/.config/waybar/style.css
stow -t ~ waybar
```

### 6) Temporarily switch to Omarchy defaults

Disable your package, restore default, and re-enable later.

```bash
cd ~/dotfiles
stow -D -t ~ waybar
omarchy-refresh-waybar

# later
rm ~/.config/waybar/config.jsonc ~/.config/waybar/style.css
stow -t ~ waybar
omarchy-restart-waybar
```
