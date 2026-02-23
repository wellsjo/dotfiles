## Project Structure

```
dotfiles/
├── zshrc, vimrc, gitconfig, ...   # macOS configs (default)
├── wsl/                            # WSL/Linux-specific overrides
│   └── zshrc                       # Use this instead of root zshrc on WSL
├── vim/                            # Vim plugins/config
└── tmux/                           # Tmux config
```

**Key:** Root configs are for macOS. The `wsl/` directory contains Linux/WSL-specific versions where needed (e.g., `ls` vs `gls`).

---

## macOS Setup

### Configs
- zsh
- vim
- tmux
- git

TODO make step by step instructions

### Dependencies
- oh-my-zsh
- Homebrew
- vim
- tmux (brew)
- tpm https://github.com/tmux-plugins/tpm
- icdiff (pip)
- htop (brew)
- go (brew)
- nodejs (nvm)
- pure (https://github.com/sindresorhus/pure)
- ctags
- gotags

### Install
Paste this in the terminal
```bash
git clone git@github.com:wellsjo/dotfiles.git ~/.dotfiles; ~/.dotfiles/setup
```

### Install Nerd Fonts
Set font to `MonaspaceNe Nerd Font Mono`
```
brew install --cask font-monaspace-nerd-font font-noto-sans-symbols-2
brew install bc coreutils gawk gh glab gsed jq nowplaying-cli
```

make sure /usr/local/bin comes before /usr/bin in $PATH