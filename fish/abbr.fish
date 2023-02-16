abbr -a -U -- wm swaymsg
abbr -a -U -- wlc wl-copy
abbr -a -U -- wl wally-cli
abbr -a -U -- weather 'curl wttr.in'
abbr -a -U -- venv 'python -m venv'
abbr -a -U -- tds 'trash .DS_Store'
abbr -a -U -- :g lazygit
abbr -a -U -- current pwd\ \|\ awk\ -F\ \'/\'\ \ \'\{print\ \$NF\}\'
abbr -a -U -- rbmaster 'git rebase master'
abbr -a -U -- dk 'docker kill'
abbr -a -U -- lti 'lt insights/ InsightEngine/'
abbr -a -U -- cleanimages 'docker rmi (docker images -q -f dangling=true)'
abbr -a -U -- guntrack 'git rm -r --cached'
abbr -a -U -- :ql 'cd ~/qlair'
abbr -a -U -- gau 'git add -u'
abbr -a -U -- b bat
abbr -a -U -- :xt emacsclient\ -t\ -a\ \'\'\ --
abbr -a -U -- :vs 'pipenv shell'
abbr -a -U -- :vrf 'pipenv run format'
abbr -a -U -- pipi 'python -m pip install'
abbr -a -U -- :vr 'pipenv run'
abbr -a -U -- :bm 'cd (cat  ~/.bookmarks | fzf )'
abbr -a -U -- :sw swaymsg
abbr -a -U -- :b 'cd -'
abbr -a -U -- gdel 'git branch -d'
abbr -a -U -- pip 'python -m pip'
abbr -a -U -- :vrt 'pipenv run tests'
abbr -a -U -- rt 'docker compose exec api pipenv run tests'
abbr -a -U -- :or 'poetry run'
abbr -a -U -- pyhttp 'python -m http.server'
abbr -a -U -- moon 'curl wttr.in/moon'
abbr -a -U -- :ammend 'git commit --amend'
abbr -a -U -- dcr 'docker compose run'
abbr -a -U -- :cm 'cmatrix -absCcyan'
abbr -a -U -- :cwd 'pwd | pbcopy'
abbr -a -U -- :loc 'export AWS_PROFILE=local'
abbr -a -U -- dj django-admin
abbr -a -U -- lgg 'l --grid'
abbr -a -U -- :sb 'lvim ~/.scrumnote'
abbr -a -U -- :ke 'kitty +edit-config'
abbr -a -U -- covlet 'pandoc --pdf-engine=xelatex --template=moderncv.tex source/letter.md -o output/coverletter-(git rev-parse --abbrev-ref HEAD).pdf'
abbr -a -U -- :v pipenv
abbr -a -U -- c cargo
abbr -a -U -- :vrl 'pipenv run local'
abbr -a -U -- pc pre-commit
abbr -a -U -- gb 'git branch'
abbr -a -U -- ga 'git add -A'
abbr -a -U -- :bma 'pwd >> ~/.bookmarks'
abbr -a -U -- :po poetry
abbr -a -U -- pmrf 'pnpm run format'
abbr -a -U -- :dev 'export AWS_PROFILE=dev_qlair'
abbr -a -U -- :sand 'export AWS_PROFILE=sandbox'
abbr -a -U -- gp 'git pull'
abbr -a -U -- :syu 'sudo pacman -Syu'
abbr -a -U -- pd prevd
abbr -a -U -- ipy ipython
abbr -a -U -- :t 'tmux attach -t'
abbr -a -U -- cleancontainers 'docker rm -v (docker ps -a -q -f status=exited)'
abbr -a -U -- gd 'git diff'
abbr -a -U -- pca 'pre-commit run --all-files'
abbr -a -U -- :ln 'l -s newest'
abbr -a -U -- dc 'docker compose'
abbr -a -U -- :py python
abbr -a -U -- gsl 'git stash list'
abbr -a -U -- g git
abbr -a -U -- :k kitty
abbr -a -U -- bt rofi-bluetooth
abbr -a -U -- gbm 'git branch --merged'
abbr -a -U -- d docker
abbr -a -U -- gba 'git branch -a'
abbr -a -U -- :prod 'export AWS_PROFILE=prod_qlair'
abbr -a -U -- :o poetry
abbr -a -U -- :path 'export PYTHONPATH=/home/bbonsign/qlair/infra.git/develop/Lambda/DatabaseLayers/python/lib/python3.8/site-packages'
abbr -a -U -- :os 'poetry shell'
abbr -a -U -- gl 'git log --oneline -n 40'
abbr -a -U -- dps 'docker ps'
abbr -a -U -- dpsa 'docker ps -a'
abbr -a -U -- nd nextd
abbr -a -U -- dud 'du -sh * | sort -rh'
abbr -a -U -- gwtr 'git worktree remove'
abbr -a -U -- gll 'git log --graph --oneline --abbrev-commit --decorate --all'
abbr -a -U -- e lvim
abbr -a -U -- ed edgedb
abbr -a -U -- myip 'curl ifconfig.co'
abbr -a -U -- edi 'edgedb instance'
abbr -a -U -- rmimages 'docker rmi (docker images -q -f dangling=true)'
abbr -a -U -- gbsu 'git branch --set-upstream-to origin/(git rev-parse --abbrev-ref HEAD)'
abbr -a -U -- gc 'git commit'
abbr -a -U -- tmp 'cd /tmp'
abbr -a -U -- :euprod 'export AWS_PROFILE=prod_qlair_eu'
abbr -a -U -- gcb 'git clone-bare'
abbr -a -U -- :q clear
abbr -a -U -- gpr 'git pull --rebase'
abbr -a -U -- nv nvim
abbr -a -U -- gch 'git checkout'
abbr -a -U -- lb libinput-gestures
abbr -a -U -- nf neofetch
abbr -a -U -- dce 'docker compose exec'
abbr -a -U -- gcm 'git commit -m'
abbr -a -U -- :pwd 'pwd | pb'
abbr -a -U -- gcp 'git cherry-pick'
abbr -a -U -- gds 'git diff --staged'
abbr -a -U -- gf 'git fetch'
abbr -a -U -- glog 'git log --oneline'
abbr -a -U -- gpsu 'git push --set-upstream origin'
abbr -a -U -- gnew 'git checkout -b'
abbr -a -U -- gwtl 'git worktree list'
abbr -a -U -- grpo 'git remote prune origin'
abbr -a -U -- gsh 'git stash'
abbr -a -U -- gst 'git status'
abbr -a -U -- gsd 'git stash show -p'
abbr -a -U -- n nnn
abbr -a -U -- gwta 'git worktree add'
abbr -a -U -- gtrack 'git checkout --track'
abbr -a -U -- lg 'l --git'
abbr -a -U -- :si 'pacman -Si'
abbr -a -U -- m mix
abbr -a -U -- zv 'nvim (z | cut -d: -f1-2)'
abbr -a -U -- :rf 'pnpm run format'
abbr -a -U -- mang 'python manage.py'
abbr -a -U -- mux tmuxinator
abbr -a -U -- na 'notify audio'
abbr -a -U -- gwt 'git worktree'
abbr -a -U -- pm pnpm
abbr -a -U -- pmr 'pnpm run'
abbr -a -U -- :ld 'l --only-dirs'
abbr -a -U -- pmrd 'pnpm run dev'
abbr -a -U -- pyhton python
abbr -a -U -- ripy ipython\ --ipython-dir\ .ipython/\ --profile=\(pwd\ \|\ awk\ -F\ \"/\"\ \'\{print\ \$NF\}\'\)
