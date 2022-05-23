function nv --wraps='open (exa -rs newest | head -1)' --wraps=nvim --description 'alias nv nvim'
  nvim $argv; 
end
