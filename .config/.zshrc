# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

DISABLE_LS_COLORS="false"

plugins=(git colored-man-pages extract zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

eval "$(starship init zsh)"
