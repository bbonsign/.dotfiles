starship init fish | source

bind \e\cs _add_sudo
# option-ctrl-s

# set -x PATH /home/linuxbrew/.linuxbrew/bin ~/.cargo/bin $PATH

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


# See https://github.com/jethrokuan/fzf for variables to set
# This plug in is currently uninstalled
# set -xg FZF_CD_OPTS "--preview 'tree -C {} | head -200'"
# set -xg FZF_PREVIEW_FILE_CMD "bat --color=always --plain"
# set -xg FZF_PREVIEW_DIR_CMD "tree -C"
# set -xg FZF_ENABLE_OPEN_PREVIEW 1

# Set nvim to default editor
# CTRL-x opens EDITOR for editing long commands (C-x C-x in tmux)
# Note: Alt-e and Alt-v also open EDITOR for editing commands
set -xg EDITOR nvim
bind \cx edit_command_buffer

# open man pages in neovim
set -xg MANPAGER 'nvim +Man!'

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
  pyenv init --path | source
end

# Created by `userpath` on 2021-02-23 17:48:18
set PATH $PATH /Users/bbonsign/.local/bin

set os (uname)
if test "$os" = "Linux"
    source ~/.asdf/asdf.fish
else
    # Mac/homebrew
    source /usr/local/opt/asdf/libexec/asdf.fish
end

