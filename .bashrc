#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Keybindings
set -o vi


# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias subl='/opt/sublime_text/sublime_text'
alias ls='/usr/bin/ls -l --group-directories-first --color=auto'
alias vim='nvim'

PS1='[\u@\h \W]\$ '

# Invoke Z
#
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

eval "$(starship init bash)"


export PATH=$PATH:~/go/bin
