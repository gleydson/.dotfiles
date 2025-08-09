#! /bin/bash

DOTFILES=(.bash_profile .gitconfig .gitignore .zshrc)

for dotfile in $(echo ${DOTFILES[*]});
do
    cp ~/.dotfiles/$(echo $dotfile) ~/$(echo $dotfile)
done

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

xargs brew install < apps.txt
