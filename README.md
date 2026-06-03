# dotfiles

My personal config, rebuilt from what's actually in use (June 2026). Everything
under `home/` mirrors its location in `$HOME` and is symlinked into place by
`bootstrap.sh`.

## What's here

| Path | Tool |
|------|------|
| `home/.config/fish/` | fish shell — `config.fish`, `conf.d/`, `functions/`, `fish_plugins` |
| `home/.config/starship.toml` | starship prompt |
| `home/.config/nvim/` | Neovim (LazyVim) |
| `home/.config/ghostty/` | Ghostty terminal + theme |
| `home/.gitconfig`, `home/.config/git/` | git config, global ignore, hooks |
| `home/.config/delta/` | delta diff theme (included by gitconfig) |
| `home/.config/gitignore_global` | global gitignore |
| `home/.claude/` | Claude Code `settings.json`, statusline, personal skills |

## Install

```sh
./bootstrap.sh
```

Symlinks each tracked path into `$HOME`. Any existing real file is moved to
`<name>.bak` first; re-running is idempotent.

Then:

```sh
fisher update   # install fish plugins listed in fish_plugins
nvim            # let lazy.nvim sync plugins on first launch
```

## Notes

- **fish:** plugin-generated `completions/` and machine-local `fish_variables`
  are intentionally **not** tracked — `fisher update` regenerates them from
  `fish_plugins`.
- **Prerequisites** (installed separately, e.g. via Homebrew): `fish`,
  `starship`, `neovim`, `ghostty`, `git`, `delta`, `atuin`, `fnm`, `bat`,
  `eza`, `fzf`, `pnpm`/`bun`.
