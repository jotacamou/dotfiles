# herdr

Config for [herdr](https://github.com/ogulcancelik/herdr), a terminal workspace
manager for coding agents.

herdr reads its config from `$XDG_CONFIG_HOME/herdr` (i.e. `~/.config/herdr`).

## Contents

- `config.toml` — keybindings, theme, and UI settings
- `scripts/toggle-orientation.sh` — `prefix + space` layout toggle for 2-pane tabs

## Install on a new machine

Symlink (preferred — edits stay tracked in this repo):

```sh
mkdir -p ~/.config/herdr/scripts
ln -sf "$PWD/config.toml"                 ~/.config/herdr/config.toml
ln -sf "$PWD/scripts/toggle-orientation.sh" ~/.config/herdr/scripts/toggle-orientation.sh
```

Or copy:

```sh
mkdir -p ~/.config/herdr/scripts
cp config.toml                 ~/.config/herdr/config.toml
cp scripts/toggle-orientation.sh ~/.config/herdr/scripts/
```

Apply without restarting a running server:

```sh
herdr server reload-config
```

## Note: machine-specific path

`config.toml` binds `prefix+space` to an absolute script path:

```
command = "/Users/jr/.config/herdr/scripts/toggle-orientation.sh"
```

This assumes the home directory is `/Users/jr`. On a machine with a different
username, update that path to match (herdr does not expand `~` or `$HOME` in the
command string).

`toggle-orientation.sh` requires `jq` on `PATH`.
