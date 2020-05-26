fpath=(/usr/local/share/zsh-completions $fpath)
eval "$(starship init zsh)"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Get ls output with colors
# Zsh to use the same colors as ls
#LS_COLORS='no=00;37:fi=00:di=1;33:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
LSCOLORS='Exfxcxdxbxcxdxbhagacad'
export LSCOLORS
zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}

alias ls='ls -GH'
alias ll='ls -al'

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias gdot='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

export PATH="$HOME/doom-emacs/bin/:$PATH"
