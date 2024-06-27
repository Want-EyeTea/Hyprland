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
alias ls='ls -l --group-directories-first --color=auto'
alias vim='nvim'
alias zellijd='zellij delete-all-sessions'
alias za='zellij a 1'

# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.='exa -ald --color=always --group-directories-first --icons .*' # show only dotfiles

# Replace cat with bat
alias cat='bat --style header --style snip --style changes --style header'

PS1='[\u@\h \W]\$ '

# Invoke Z
#
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

eval "$(starship init bash)"


export PATH=$PATH:~/go/bin:/home/admin/.local/bin
