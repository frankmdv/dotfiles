source ~/.config/zsh/znap/zsh-snap/znap.zsh


# ohmyzsh configuration
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
source $ZSH/oh-my-zsh.sh

plugins=(git)

# Default editor
export EDITOR=/usr/bin/nvim

# Plugins Configuration znap
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-syntax-highlighting
