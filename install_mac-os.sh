#!/bin/bash

# Global Variables
END=$'\e[0m'
CYAN='\033[00;36m'
GREEN='\033[00;32m'
password=""

function info() {
  printf "\n${CYAN}%s${END}\n" "$*"
}

function success() {
  printf "\n${GREEN}%s${END}\n" "$*"
}

function install() {
    info "Installing ${1}"
    eval $1
    success "${1} installed"
}

function installer() {
    program="$1"
    install="$2"
    override="$3"

    if test -n "$override"; then
        install "${install}"
        return
    fi

    if command -v $program >/dev/null 2>&1; then
        info "${program} already installed"
    else
        install "${install}"
    fi
    
    info "Don't forget to manually download telegram for Mac OS and XCode from the Apple Store"
}

if test -e "$HOME/oh-my-zsh.sh"; then
    info "oh-my-zsh already installed"
else
    echo ${password} | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ln -sfn `pwd`/.zshrc ~/.zshrc
fi

installer "brew" 'echo ${password} | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'

brew update

installer "brew cask" "brew tap caskroom/cask"

installer "git" "brew install git --with-default-names"

installer "python" "brew install python --with-default-names && echo ${password} | sudo easy_install pip && brew install python3"

installer "zsh" "brew install zsh --with-default-names; info \"Add write permission to /usr/local/share\"; chmod go-w \"/usr/local/share\"; success \"Write permission added to /usr/local/share\""

installer "nvm" "brew tap homebrew/core && brew install node && brew install nvm && mkdir $HOME/.nvm && export NVM_DIR="$HOME/.nvm" && source "/usr/local/opt/nvm/nvm.sh" && nvm install stable"

installer "java" 'echo ${password} | brew cask install java'

installer "gradle" "brew install gradle"
  
installer "yarn" "brew install yarn"

installer "hyper" "brew cask install hyper"
  
installer "postman" "brew cask install postman"

installer "intellij-idea" "brew cask install intellij-idea"

installer "android-studio" "brew cask install android-studio"

installer "spotify" "brew cask install spotify"

installer "slack" "brew cask install slack"

installer "zsh-autosuggestions" "git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

installer "zsh-syntax-highlighting" "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

installer "zsh-apple-touchbar" "git clone https://github.com/zsh-users/zsh-apple-touchbar $ZSH_CUSTOM/plugins/zsh-apple-touchbar"

installer "whatsapp" "brew cask install whatsapp"

installer "fastlane" "brew install fastlane"

installer "google-chrome" "brew cask install google-chrome"

installer "ffmpeg" "brew install ffmpeg"

installer "vscode" "brew cask install visual-studio-code"

echo "Making Zsh the default shell"
chsh -s $(which zsh)
