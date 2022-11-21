starship init fish | source

# set fish_greeting (set_color blue) "🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟" 
# set fish_greeting

if command -v fzf_configure_bindings 1>/dev/null 2>&1
    fzf_configure_bindings --variables=
    fzf_configure_bindings --variables=\e\cv
    fzf_configure_bindings --variables=\e\cv
end

source ~/.config/nnn/nnn_env_vars
source ~/.config/fish/colors/fish_tokyonight_storm.fish

set -xg PAGER 'bat --plain'

# bgcolor of the current tab completion selection
set fish_color_search_match --background=4b719c

set -xg FZF_DEFAULT_COMMAND "fd --color always --no-ignore --follow --ignore-file '$HOME/.config/fd/ignore'"
set -xg FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -xg FZF_ALT_C_COMMAND "$FZF_DEFAULT_COMMAND --type d"
set -xg FZF_DEFAULT_OPTS '--ansi --inline-info --height=100% --pointer="⦿" --prompt=" " --color="pointer:#599fd8" --bind=ctrl-u:preview-up,ctrl-d:preview-down,ctrl-space:toggle-preview --preview-window=right:65%'
# Bind ? key for toggling the preview window.
set -xg FZF_CTRL_R_OPTS "--preview 'echo {}' --preview-window up:10:hidden:wrap --bind '?:toggle-preview'"
# Shows tree of the directory in the preview window
set -xg FZF_ALT_C_OPTS "--preview 'tree -C {} | head -200'"
bind \e\cc $FZF_ALT_C_COMMAND


# See https://github.com/jethrokuan/fzf for variables to set
# This plug in is currently uninstalled
# set -xg FZF_CD_OPTS "--preview 'tree -C {} | head -200'"
# set -xg FZF_PREVIEW_FILE_CMD "bat --color=always --plain"
# set -xg FZF_PREVIEW_DIR_CMD "tree -C"
# set -xg FZF_ENABLE_OPEN_PREVIEW 1

# Set nvim to default editor
# CTRL-x opens EDITOR for editing long commands (C-x C-x in tmux)
# Note: Alt-e and Alt-v also open EDITOR for editing commands
set -xg EDITOR lvim
set -xg VISUAL lvim
bind \cx edit_command_buffer

# open man pages in neovim
set -xg MANPAGER 'lvim +Man!'

set fish_cursor_visual block
if command -sq gls
    function ls --description "ls command of GNU coreutils"
        set -l param --color=auto
        if isatty 1
            set param $param --indicator-style=classify --group-directories-first
        end
        command gls -h $param $argv
    end

    if not set -q LS_COLORS
        if command -sq gdircolors
            set -l colorfile
            for file in ~/.dir_colors ~/.dircolors
                if test -f $file
                    set colorfile $file
                    break
                end
            end
            set -gx LS_COLORS (gdircolors -c $colorfile | string split ' ')[3]
            if string match -qr '^([\'"]).*\1$' -- $LS_COLORS
                set LS_COLORS (string match -r '^.(.*).$' $LS_COLORS)[2]
            end
        end
    end
end


# fnm - fast node manager
# set PATH /home/bbonsign/.fnm $PATH
# fnm env --multi | source

if command -v pyenv 1>/dev/null 2>&1
    pyenv init - | source
end

# Created by `userpath` on 2021-02-23 17:48:18
# set PATH $PATH /Users/bbonsign/.local/bin

set os (uname)
if test "$os" = "Linux"
    # source ~/.asdf/asdf.fish
    source /opt/asdf-vm/asdf.fish
else
    # Mac/homebrew
    source /usr/local/opt/asdf/libexec/asdf.fish
end

# pipenv completions: https://pipenv.pypa.io/en/latest/advanced/#shell-completion
eval (env _PIPENV_COMPLETE=fish_source pipenv)

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

set -gx PNPM_HOME "/Users/bbonsign/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
