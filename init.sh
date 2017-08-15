mv ~/.bashrc ~/.bashrc.org
mv ~/.zshrc ~/.zshrc.org
mv ~/.gitconfig ~/.gitconfig.org
mv ~/.tmux.conf ~/.tmux.conf.org
ln -s ~/.dotfiles/bashrc     ~/.bashrc
ln -s ~/.dotfiles/zshrc      ~/.zshrc
ln -s ~/.dotfiles/gitconfig  ~/.gitconfig
ln -s ~/.dotfiles/tmux.conf  ~/.tmux.conf
