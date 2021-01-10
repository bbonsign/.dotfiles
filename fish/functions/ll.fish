# Defined in - @ line 1
function ll --wraps=ls --wraps='exa --long --group-directories-first --icons' --description 'alias ll exa --long --group-directories-first --icons'
  exa --long --group-directories-first --icons $argv;
end
