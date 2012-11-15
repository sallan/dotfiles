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

# Put aliases here for now
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
