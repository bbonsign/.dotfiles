abbr -a -- wm swaymsg
abbr -a -- wlc wl-copy
abbr -a -- wl wally-cli
abbr -a -- weather 'curl wttr.in'
abbr -a -- venv 'python -m venv'
abbr -a -- tds 'trash .DS_Store'
abbr -a -- :g lazygit
abbr -a -- current pwd\ \|\ awk\ -F\ \'/\'\ \ \'\{print\ \$NF\}\'
abbr -a -- rbmaster 'git rebase master'
abbr -a -- dk 'docker kill'
abbr -a -- lti 'lt insights/ InsightEngine/'
abbr -a -- cleanimages 'docker rmi (docker images -q -f dangling=true)'
abbr -a -- guntrack 'git rm -r --cached'
abbr -a -- :ql 'cd ~/qlair'
abbr -a -- gau 'git add -u'
abbr -a -- b bat
abbr -a -- :xt emacsclient\ -t\ -a\ \'\'\ --
abbr -a -- :vs 'pipenv shell'
abbr -a -- :vrf 'pipenv run format'
abbr -a -- pipi 'python -m pip install'
abbr -a -- :vr 'pipenv run'
abbr -a -- :bm 'cd (cat  ~/.bookmarks | fzf )'
abbr -a -- :sw swaymsg
abbr -a -- :b 'cd -'
abbr -a -- gdel 'git branch -d'
abbr -a -- pip 'python -m pip'
abbr -a -- :vrt 'pipenv run tests'
abbr -a -- rt 'docker compose exec api pipenv run tests'
abbr -a -- :or 'poetry run'
abbr -a -- pyhttp 'python -m http.server'
abbr -a -- moon 'curl wttr.in/moon'
abbr -a -- gca 'git commit --amend'
abbr -a -- dcr 'docker compose run'
abbr -a -- :cm 'cmatrix -absCcyan'
abbr -a -- :cwd 'pwd | pbcopy'
abbr -a -- :loc 'export AWS_PROFILE=local'
abbr -a -- dj django-admin
abbr -a -- lgg 'l --grid'
abbr -a -- :sb 'lvim ~/.scrumnote'
abbr -a -- :ke 'kitty +edit-config'
abbr -a -- covlet 'pandoc --pdf-engine=xelatex --template=moderncv.tex source/letter.md -o output/coverletter-(git rev-parse --abbrev-ref HEAD).pdf'
abbr -a -- :v pipenv
abbr -a -- c cargo
abbr -a -- :vrl 'pipenv run local'
abbr -a -- pc pre-commit
abbr -a -- gb 'git branch'
abbr -a -- ga 'git add -A'
abbr -a -- :bma 'pwd >> ~/.bookmarks'
abbr -a -- :po poetry
abbr -a -- pmrf 'pnpm run format'
abbr -a -- pmrg 'pnpm run generate-client'
abbr -a -- :dev 'export AWS_PROFILE=dev_qlair'
abbr -a -- :sand 'export AWS_PROFILE=sandbox'
abbr -a -- gp 'git pull'
abbr -a -- :syu 'sudo pacman -Syu'
abbr -a -- pd prevd
abbr -a -- ipy ipython
abbr -a -- :t 'tmux attach -t'
abbr -a -- cleancontainers 'docker rm -v (docker ps -a -q -f status=exited)'
abbr -a -- gd 'git diff'
abbr -a -- pca 'pre-commit run --all-files'
abbr -a -- :ln 'l -s newest'
abbr -a -- dc 'docker compose'
abbr -a -- :py python
abbr -a -- gsl 'git stash list'
abbr -a -- g git
abbr -a -- :k kitty
abbr -a -- bt rofi-bluetooth
abbr -a -- gbm 'git branch --merged'
abbr -a -- d docker
abbr -a -- gba 'git branch -a'
abbr -a -- :prod 'export AWS_PROFILE=prod_qlair'
abbr -a -- :o poetry
abbr -a -- :path 'export PYTHONPATH=/home/bbonsign/qlair/infra.git/develop/Lambda/DatabaseLayers/python/lib/python3.8/site-packages'
abbr -a -- :os 'poetry shell'
abbr -a -- gl 'git log --oneline -n 40'
abbr -a -- dps 'docker ps'
abbr -a -- dpsa 'docker ps -a'
abbr -a -- nd nextd
abbr -a -- dud 'du -sh * | sort -rh'
abbr -a -- gwtr 'git worktree remove'
abbr -a -- gll 'git log --graph --oneline --abbrev-commit --decorate --all'
abbr -a -- e lvim
abbr -a -- ed edgedb
abbr -a -- myip 'curl ifconfig.co'
abbr -a -- edi 'edgedb instance'
abbr -a -- rmimages 'docker rmi (docker images -q -f dangling=true)'
abbr -a -- gbsu 'git branch --set-upstream-to origin/(git rev-parse --abbrev-ref HEAD)'
abbr -a -- gc 'git commit'
abbr -a -- tmp 'cd /tmp'
abbr -a -- :euprod 'export AWS_PROFILE=prod_qlair_eu'
abbr -a -- gcb 'git clone-bare'
abbr -a -- :q clear
abbr -a -- gpr 'git pull --rebase'
abbr -a -- nv nvim
abbr -a -- gch 'git checkout'
abbr -a -- lb libinput-gestures
abbr -a -- :nf neofetch
abbr -a -- dce 'docker compose exec'
abbr -a -- gcm 'git commit -m'
abbr -a -- :pwd 'pwd | pb'
abbr -a -- gcp 'git cherry-pick'
abbr -a -- gds 'git diff --staged'
abbr -a -- gf 'git fetch'
abbr -a -- glog 'git log --oneline'
abbr -a -- gpsu 'git push --set-upstream origin'
abbr -a -- gnew 'git checkout -b'
abbr -a -- gwtl 'git worktree list'
abbr -a -- grpo 'git remote prune origin'
abbr -a -- gsh 'git stash'
abbr -a -- gst 'git status'
abbr -a -- gsd 'git stash show -p'
abbr -a -- n nnn
abbr -a -- gwta 'git worktree add'
abbr -a -- gtrack 'git checkout --track'
abbr -a -- lg 'l --git'
abbr -a -- :si 'pacman -Si'
abbr -a -- m mix
abbr -a -- zv 'nvim (z | cut -d: -f1-2)'
abbr -a -- :rf 'pnpm run format'
abbr -a -- mang 'python manage.py'
abbr -a -- mux tmuxinator
abbr -a -- na 'notify audio'
abbr -a -- gwt 'git worktree'
abbr -a -- pm pnpm
abbr -a -- pmr 'pnpm run'
abbr -a -- :ld 'l --only-dirs'
abbr -a -- pmrd 'pnpm run dev'
abbr -a -- pyhton python
abbr -a -- ids 'cat seeds.txt | fzf --bind \'ctrl-v:execute-silent(echo {2} | wl-copy)+accept,enter:execute-silent(echo {2} | wl-copy)\''
abbr -a -- ripy ipython\ --ipython-dir\ .ipython/\ --profile=\(pwd\ \|\ awk\ -F\ \"/\"\ \'\{print\ \$NF\}\'\)
