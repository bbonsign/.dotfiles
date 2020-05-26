
PS1="\[\033[0;32m\]✔ \[\033[0;33m\]\w\[\033[0;0m\] \n\[\033[0;37m\]$(date +%H:%M)\[\033[0;0m\] $"




[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias gdot='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'


export PATH="$HOME/doom-emacs/bin/:$PATH"
