# Defined via `source`
function nv --wraps='open (exa -rs newest | head -1)' --description 'alias nv=open (exa -rs newest | head -1)'
  open (exa -rs newest | head -1) $argv; 
end
