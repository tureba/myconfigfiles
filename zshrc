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

setopt appendhistory autocd cbases correct extendedglob inc_append_history menu_complete null_glob
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
bindkey -v
vibindkey() {
	bindkey -M vicmd "$1" $2
	bindkey -M viins "$1" ${3:-$2}
}
# fix backwards history search
vibindkey "^r" history-incremental-search-backward
# line movements in command mode
bindkey -M vicmd "0" beginning-of-line
bindkey -M vicmd "$" end-of-line

autoload zkbd
[[ -f ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE} ]] || zkbd
source ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}
[[ -n ${key[Backspace]} ]] && vibindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && vibindkey "${key[Insert]}" vi-insert overwrite-mode
[[ -n ${key[Home]} ]] && vibindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && vibindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && vibindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && vibindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && vibindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && vibindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && vibindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && vibindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && vibindkey "${key[Right]}" forward-char


# tmux output logging per cmd
function tmux_cycle_output {
	# redirect output of next command to a file
	tmux pipe-pane -o "cat >>#{d:socket_path}/%F-%T-zsh-$$-$HISTCMD.txt"
}

# update tmux environment variables after reattachment
function update_remote_env {
	eval $(tmux switch-client\; showenv -s)
}

# if zsh is immediately inside tmux (not a subshell)
if [[ -n $TMUX ]] && grep -q '^tmux\b' /proc/$PPID/cmdline; then
	# output file and remote env per command
	precmd_functions+=( tmux_cycle_output )
	precmd_functions+=( update_remote_env )
fi
