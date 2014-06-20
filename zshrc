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

setopt appendhistory autocd correct correctall extendedglob inc_append_history menu_complete null_glob
unsetopt beep nomatch

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
# smv *.txt *.html
alias smv='noglob zmv -W'

zstyle ':completion:*' menu select
# End of lines added by compinstall

# key bindings: vi mode
# needs tweaks to be less vi mode and more vim mode
bindkey -v
# fix backwards history search
bindkey -M viins "^r" history-incremental-search-backward
bindkey -M vicmd "^r" history-incremental-search-backward
# fix backspace key
bindkey -M viins "^H" backward-delete-char
bindkey -M vicmd "^H" backward-delete-char
bindkey -M viins "^?" backward-delete-char
bindkey -M vicmd "^?" backward-delete-char
# fix insert key
bindkey -M viins "^[[2~" overwrite-mode
bindkey -M vicmd "^[[2~" overwrite-mode
# fix delete key
bindkey -M viins "^[[3~" delete-char
bindkey -M vicmd "^[[3~" delete-char
# fix arrow keys
bindkey -M viins "^[[A" up-line-or-history
bindkey -M vicmd "^[[A" up-line-or-history
bindkey -M viins "^[[B" down-line-or-history
bindkey -M vicmd "^[[B" down-line-or-history
bindkey -M viins "^[[C" forward-char
bindkey -M vicmd "^[[C" forward-char
bindkey -M viins "^[[D" backward-char
bindkey -M vicmd "^[[D" backward-char
# line movements in commnad mode (needs home and end)
bindkey -M vicmd "0" beginning-of-line
bindkey -M vicmd "$" end-of-line
# line movements in insert mode
bindkey -M viins "^[[7~" beginning-of-line # home
bindkey -M viins "^[[8~" end-of-line # end
# ...still needs a lot of work...
