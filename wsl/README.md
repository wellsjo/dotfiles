# WSL Setup Instructions

1. Clone dotfiles repo
```bash
git clone git@github.com:wellsjo/dotfiles.git ~/.dotfiles
```

2. Install dependencies with apt
```bash
sudo apt update
sudo apt install zsh vim tmux git curl wget
```

3. Install Pure
```bash
mkdir -p ~/.zsh
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
```

4. Create symlinks
```bash
ln -s ~/.dotfiles/wsl/zshrc ~/.zshrc
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
```

5. Install vim plugins
```bash
vim +PlugInstall +qall +silent
```

6. Install oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

7. Change shell to zsh
```bash
chsh -s $(which zsh)
```

8. Install tmux plugins
```bash
# enter tmux
tmux
# Now enter: `Ctrl + b` followed by `I`
```

9. Move aliases/exports to `~/.localprofile`
`.zshrc` sources this file if it exists.

10. Restart terminal, test tmux alias with `t`
If tmux starts, and there are no errors, that means zsh is working correctly.