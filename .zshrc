
export ZSH="/Users/$USER/.oh-my-zsh"

ZSH_THEME="agnoster"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-apple-touchbar
)

source $ZSH/oh-my-zsh.sh

# Color variables

RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
CYAN='\033[00;36m'
WHITE='\033[01;37m'

END=$'\e[0m'

# Functions

log() {
  printf "\n${WHITE}%s${END}\n" "$*"
}

error() {
  printf "\n${RED}%s${END}\n" "$*"
}

warning() {
  printf "\n${YELLOW}%s${END}\n" "$*"
}

info() {
  printf "\n${CYAN}%s${END}\n" "$*"
}

success() {
  printf "\n${GREEN}%s${END}\n" "$*"
}

# Alias
alias gohome="cd $HOME"
alias goprojects="cd $HOME/projects"
alias gopessoais="cd $HOME/projects/pessoais"
alias gogm="cd $HOME/projects/greenmile"
alias gomyorder="cd $HOME/projects/greenmile/gm-myorder"
alias gogrc="cd $HOME/projects/greenmile/gm-react-components"

# Paths

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# Android
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
