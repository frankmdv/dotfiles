# Download Znap, if it's not there yet.
[[ -r ~/.config/zsh/znap/znap.zsh ]] || git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.config/zsh/znap
source ~/.config/zsh/znap/znap.zsh  # Start Znap

# Znap plugins
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-syntax-highlighting

# ZSH config
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster" # ZSH theme
plugins=(git) # ZSH plugins
source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR=/usr/bin/nvim
