let g:slime_target = "tmux"

let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}

xmap <silent> <localleader>rh :exec 'let g:slime_default_config.target_pane = "{left-of}"'<cr><Plug>SlimeRegionSend
xmap <silent> <localleader>rj :exec 'let g:slime_default_config.target_pane = "{down-of}"'<cr><Plug>SlimeRegionSend
xmap <silent> <localleader>rk :exec 'let g:slime_default_config.target_pane = "{up-of}"'<cr><Plug>SlimeRegionSend
xmap <silent> <localleader>rl :exec 'let g:slime_default_config.target_pane = "{right-of}"'<cr><Plug>SlimeRegionSend
nmap <silent> <localleader>rh :exec 'let g:slime_default_config.target_pane = "{left-of}"'<cr><Plug>SlimeParagraphSend
nmap <silent> <localleader>rj :exec 'let g:slime_default_config.target_pane = "{down-of}"'<cr><Plug>SlimeParagraphSend
nmap <silent> <localleader>rk :exec 'let g:slime_default_config.target_pane = "{up-of}"'<cr><Plug>SlimeParagraphSend
nmap <silent> <localleader>rl :exec 'let g:slime_default_config.target_pane = "{right-of}"'<cr><Plug>SlimeParagraphSend
