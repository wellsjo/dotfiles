## Project Structure

```
dotfiles/
├── zshrc, vimrc, gitconfig, ...   # macOS configs (default)
├── wsl/                           # Linux/WSL-specific overrides
│   └── zshrc                      # Use this instead of root zshrc on WSL
├── vim/                           # Vim plugins/config
└── tmux/                          # Tmux config
```

Root configs are for macOS. Use the files in `wsl/` on Linux/WSL where noted.

## What this repo manages

- zsh
- vim
- tmux
- git

Machine-specific aliases, exports, and secrets should live in `~/.localprofile`.
That file is sourced automatically and is not managed by this repo.

## macOS setup

### Dependencies

Install the base tools first:

```bash
brew install coreutils git go htop icdiff jq nowplaying-cli tmux vim
brew install --cask font-monaspace-nerd-font font-noto-sans-symbols-2
```

Then make sure these are installed separately if you use them:

- oh-my-zsh
- Node.js + npm
- Pure prompt (`npm install --global pure-prompt`)
- ctags / gotags if you still want the Vim tag workflows

### Install

```bash
git clone https://github.com/wellsjo/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup
```

Use `./setup --force` to replace managed files without prompts.

Then finish the editor/plugin setup manually:

```bash
vim +PlugInstall +qall
# inside tmux: prefix + I
```

### Notes

- Set your terminal font to `MonaspaceNe Nerd Font Mono`
- If you keep machine-specific config, put it in `~/.localprofile`
- Root `zshrc` expects Homebrew to be available on macOS

## WSL setup

See `wsl/README.md`.

## Caveats

- `vimrc` is still a very personal, legacy-heavy Vim setup. It works, but it is not a minimal baseline.
- The repo is designed to symlink managed files and keep machine-specific overrides in `~/.localprofile`.
