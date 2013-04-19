# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=1000
setopt appendhistory autocd notify ksh_arrays
unsetopt extendedglob
setopt no_nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sallan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PS1='[%n@%m]%~%# '
export P4CONFIG=p4.config
export P4EDITOR='emacs -nw -q'

# Source aliases file
if [ -f ~/.aliases ]; then
	. ~/.aliases
fi
