# WSL Setup Instructions

1. Clone the repo

```bash
git clone git@github.com:wellsjo/dotfiles.git ~/.dotfiles
```

2. Install dependencies

```bash
sudo apt update
sudo apt install zsh vim tmux git curl wget fzf
```

3. Install Pure

```bash
mkdir -p ~/.zsh
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
```

4. Install oh-my-zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

5. Link configs

```bash
ln -s ~/.dotfiles/wsl/zshrc ~/.zshrc
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global
```

6. Install vim plugins

```bash
vim +PlugInstall +qall +silent
```

7. Install tmux plugins

```bash
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh
```

8. Change shell to zsh

```bash
chsh -s "$(which zsh)"
```

9. Put machine-specific aliases/exports in `~/.localprofile`

`~/.zshrc` sources this file automatically if it exists.

10. Restart terminal and test `t`

If tmux starts and there are no shell errors, the setup worked.

11. Install the Nerd Font you want

`MonaspaceNe Nerd Font Mono` is the expected default.
