# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository purpose

Personal dotfiles managed by [chezmoi](https://chezmoi.io). The source directory is `~/.local/share/chezmoi`; chezmoi renders files from here into `$HOME` based on filename conventions (`dot_` → `.`, `.tmpl` → Go template, `run_onchange_` → script run when its hash changes, `private_` / `executable_` → permission prefixes).

## Common commands

- `chezmoi diff` — preview pending changes to `$HOME`
- `chezmoi apply -v` — apply changes (runs install scripts, pulls external repos, re-runs mise install if `dot_config/mise/config.toml` changed)
- `chezmoi apply <target>` — apply a single file (e.g. `chezmoi apply ~/.tmux.conf`)
- `chezmoi edit <target>` — edit the source file for a rendered target
- `chezmoi cd` — jump into this source directory
- `chezmoi execute-template < file.tmpl` — render a template for debugging

After editing files in this repo directly, run `chezmoi apply` to propagate them to `$HOME`. Editing the rendered file in `$HOME` instead will be overwritten on next apply.

## Architecture

- **Cross-platform via templates**: `.tmpl` files branch on `.chezmoi.os` (`darwin` / `linux`). `.chezmoiignore.tmpl` excludes the non-matching OS's scripts so only the relevant install script runs.
- **Package installation** is driven by `.chezmoiscripts/{darwin,linux}/run_onchange_before_install-packages.sh.tmpl`. Darwin uses `brew bundle` from an inline heredoc; Linux uses `apt-get` then installs `mise` via curl. Add packages by editing the `$brews` / `$casks` / `$packages` lists in those templates — the `run_onchange_` prefix means chezmoi re-runs the script whenever its rendered content changes.
- **Tool versions** live in `dot_config/mise/config.toml`. `run_onchange_after_99_mise.sh.tmpl` hashes that file and runs `mise install` on change; the `99_` prefix orders it after package install.
- **External dependencies** (non-chezmoi-managed repos) are declared in `.chezmoiexternal.toml` — currently just `fzf-tab` cloned into `~/.config/zsh/plugins/fzf-tab`.
- **Zsh load order**: `dot_zprofile.tmpl` (login — brew shellenv + `env.zsh`) → `dot_zshrc` (interactive only; sources `history`, `completion`, optional `local.zsh`, `plugins`, `alias`, `prompt` from `~/.config/zsh/`). `local.zsh` is gitignored via `.chezmoiignore.tmpl` for machine-specific overrides.
- **Plugin initialization** (`dot_config/zsh/plugins.zsh.tmpl`) guards every integration (`mise`, `zoxide`, `fzf`, `orbstack`, `fzf-tab`) behind `command -v` or file-exists checks so the config works on machines where a tool isn't installed.
- **Neovim** uses lazy.nvim; plugin specs live under `dot_config/nvim/lua/plugins/` and `lazy-lock.json` pins versions.
- **Tmux** (`dot_tmux.conf`) uses tpm + catppuccin; prefix is `C-a`.

## Conventions

- When adding a new shell tool integration, gate it on `command -v <tool>` to match existing patterns.
- When adding a package, put it in the correct platform's install script, not both — the OS branching happens at the `.chezmoiignore.tmpl` level.
- Scripts in `.chezmoiscripts/` that should re-run on content change must keep the `run_onchange_` prefix and reference the tracked file's hash in a comment (see the mise script).
