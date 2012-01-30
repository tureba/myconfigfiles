#
# Tureba's base bashrc
#
#   To use it, source this from .bashrc, followed by
#   the local machine's definitions. This should be
#   located in ~/.config/vim/bashrc
#
# who: Arthur Nascimento <tureba@gmail.com>
# where: github.com/tureba/myconfigfiles
#

# useful stuff
shopt -sq autocd cdspell cmdhist dirspell extglob histappend
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '

# TODO:
#	Fix the hardcoded paths.
#	Bash is silly. It keeps $0 as /bin/bash instead of the script name,
#	so I can't use ${0%/*}, and so ~/.config/vim is the way to go at the
#	moment. Zsh is smart and sets $0 correctly.

# general aliases
source ~/.config/vim/aliases

# general environment settings
source ~/.config/vim/environment

# bash-specific environment settings
export HISTSIZE=1000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth

