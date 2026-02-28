# dotfiles (GNU Stow)

User config management with `stow`, without modifying Omarchy defaults in `~/.local/share/omarchy`.

## Package layout

- `hypr` -> `~/.config/hypr/*`
- `waybar` -> `~/.config/waybar/*`

## Basic commands

- Apply `hypr` symlinks:
```bash
cd ~/dotfiles && stow -t ~ hypr
```

- Apply custom `waybar` symlinks:
```bash
cd ~/dotfiles && stow -t ~ waybar
```

- Remove custom `waybar` symlinks:
```bash
cd ~/dotfiles && stow -D -t ~ waybar
```

- Check where Waybar files point:
```bash
ls -l ~/.config/waybar/config.jsonc ~/.config/waybar/style.css
```

## Switch to Omarchy default Waybar

```bash
cd ~/dotfiles && stow -D -t ~ waybar
cp ~/.local/share/omarchy/config/waybar/config.jsonc ~/.config/waybar/
cp ~/.local/share/omarchy/config/waybar/style.css ~/.config/waybar/
omarchy-restart-waybar
```

## Switch back to dotfiles Waybar

If you restored Omarchy files with `cp`, `stow` will fail because targets are regular files (not symlinks).
Move them away first, then re-stow:

```bash
cd ~/dotfiles
mv ~/.config/waybar/config.jsonc ~/.config/waybar/config.jsonc.bak
mv ~/.config/waybar/style.css ~/.config/waybar/style.css.bak
stow -t ~ waybar
omarchy-restart-waybar
```

Alternative: adopt current files into dotfiles package:

```bash
cd ~/dotfiles && stow --adopt -t ~ waybar
```

Then review with `git diff` before committing.
