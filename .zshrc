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

# The localism value is set in general as en_CO.UTF-8
export LC_ALL=es_CO.UTF-8

# Configuration of anaconda when initializing zsh on the system or terminal
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

# __conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
#         . "/opt/anaconda/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/anaconda/bin:$PATH"
#     fi
# fi
# unset __conda_setup

# <<< conda initialize <<<
