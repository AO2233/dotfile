#!/bin/zsh -x

# apply -> .config mpv, alacritty 
cp -r "$HOME/dotfile/.config/*" $HOME/.config/
# apply -> tmux, zsh, git
cp  $HOME/dotfile/.tmux.conf $HOME/.gitconfig  $HOME
cp  $HOME/dotfile/.zshrc $HOME
