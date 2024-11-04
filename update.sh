#!/bin/zsh -x

# copy -> .config mpv, alacritty 
cp -r $HOME/.config/alacritty $HOME/.config/nvim $HOME/.config/mpv $HOME/dotfile/.config
# copy -> tmux, zsh, git
cp  $HOME/.tmux.conf $HOME/.zshrc $HOME/.vimrc $HOME/.gitconfig  $HOME/dotfile
