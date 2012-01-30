#
# Tureba's zshrc
#
#   To use it, source this from .zshrc, followed by
#   the local machine's definitions. This should be
#   located in ~/.config/vim/zshrc
#
# who: Arthur Nascimento <tureba@gmail.com>
# where: github.com/tureba/myconfigfiles
#

setopt appendhistory autocd correct extendedglob inc_append_history menu_complete null_glob share_history
unsetopt beep nomatch
bindkey -v

# general aliases
source ${0%/*}/aliases

# zsh prompt
source ${0%/*}/prompt

# general environment settings
source ${0%/*}/environment

# zsh-specific environment settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

autoload -U colors
colors

# batch renaming, e.g.:
# zmv '(*).txt' '$1.html'
autoload -U zmv

zstyle ':completion:*' menu select
# End of lines added by compinstall

