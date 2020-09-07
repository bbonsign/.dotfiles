# Defined in - @ line 1
function lt --wraps='exa --all --long --group-directories-first --icons --tree' --description 'alias lt exa --all --long --group-directories-first --icons --tree'
  exa --all --long --group-directories-first --icons --tree --ignore-glob=.git $argv;
end
