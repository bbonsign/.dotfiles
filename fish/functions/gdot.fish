# Defined in - @ line 1
function gdot --wraps='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME' --description 'Aliased git command to manage bare repo ~/.dotfiles.git'
  /usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME $argv;
end
