# dotfiles

## Modes

`./setup` is the safe portable default. It installs only:

- `~/.vimrc`
- `~/.vim`
- `~/.tmux.conf`
- `~/.gitignore_global`

It does not link `~/.zshrc`, does not link `~/.gitconfig`, and does not run global `npm` installs.

`./setup --full` enables the Wells personal setup on top of that baseline. This preserves the current shell aliases and git behavior, including aliases such as `t`, `ag`, `gs`, `gb`, `ga`, `gd`, `gl`, `gll`, and `gc`.

Managed files are symlinked and existing targets are left alone unless you confirm replacement or pass `--force`.

## Install

```bash
git clone git@github.com:wellsjo/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup
```

Use `./setup --force` to replace managed files without prompts.

For the Wells personal environment:

```bash
./setup --full
```

Or force it:

```bash
./setup --full --force
```

## Platform behavior

- macOS full mode links the root `zshrc` and `gitconfig`
- WSL full mode links `wsl/zshrc` and `gitconfig` when WSL is confidently detected
- Generic Linux falls back to the safe baseline instead of guessing at personal shell/git setup

`gitignore_global` is installed in both modes because it is low-risk and portable.

## Dependencies

Baseline setup expects only standard shell tools. Optional follow-up steps:

```bash
vim +PlugInstall +qall
# inside tmux: prefix + I
```

Full mode may also use:

- oh-my-zsh
- Node.js + npm for `pure-prompt`
- Homebrew on macOS for the root `zshrc`
- the WSL dependencies listed in `wsl/README.md`

Machine-specific aliases, exports, and secrets should live in `~/.localprofile`. Both shell configs source it automatically when present.
