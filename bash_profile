export CLICOLOR=1
export PATH="/usr/local/bin:$PATH"
[[ -f "$(brew --prefix)/etc/bash_completion" ]] && source "$(brew --prefix)/etc/bash_completion"
[[ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]] && source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"

EDITOR=nvim

source "$HOME/.cargo/env"
