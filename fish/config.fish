starship init fish | source

# ctrl-s allows for search tab completions by default in fish, so for the moment the
# binding below seems less useful
# bind \cs _add_sudo

# set -x PATH /home/linuxbrew/.linuxbrew/bin ~/.cargo/bin $PATH

# bgcolor of the current tab completion selection
set fish_color_search_match --background=4b719c

set -xg FZF_DEFAULT_COMMAND "fd --color always --no-ignore --follow --ignore-file '$HOME/.config/fd/ignore'"
set -xg FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -xg FZF_ALT_C_COMMAND "$FZF_DEFAULT_COMMAND --type d"
set -xg FZF_DEFAULT_OPTS '--ansi --inline-info --height=100% --pointer="⦿" --prompt=" " --color="pointer:#599fd8" --bind=ctrl-y:preview-up,ctrl-h:preview-down,ctrl-space:toggle-preview --preview-window=right:65%'
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

# Setting this fixed 'clear' command not working
# set -xg TERMINFO /usr/share/terminfo



# xcape allows left control to act as ESC when used alone (not as a modifier)
# Karabiner-elements does this on Mac, so this makes it possible for linux too
set os (uname)
if test "$os" = "Linux"
	xcape -e 'Control_L=Escape'
end


set fish_cursor_visual block
if command -sq gls
    function ls --description "ls command of GNU coreutils"
        set -l param --color=auto
        if isatty 1
            set param $param --indicator-style=classify --group-directories-first
        end
        command gls -h $param $argv
    end

    function ll --description "long ls command of GNU coreutils"
        set -l param --color=auto
        if isatty 1
            set param $param --indicator-style=classify --group-directories-first
        end
        command gls -Alh $param $argv
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


# # Set my keybindings
# set -g fish_key_bindings hybrid_bindings

# # Emulates vim's cursor shape behavior
# # Set the normal and visual mode cursors to a block
# set fish_cursor_default block
# # Set the insert mode cursor to a line
# set fish_cursor_insert line
# # Set the replace mode cursor to an underscore
# set fish_cursor_replace_one underscore
# # The following variable can be used to configure cursor shape in
# # visual mode, but due to fish_cursor_default, is redundant here
# set fish_cursor_visual block


# Base16 Shell
# if status --is-interactive
#     set BASE16_SHELL "$HOME/.config/base16-shell/"
#     source "$BASE16_SHELL/profile_helper.fish"
# end

# fnm - fast node manager
# set PATH /home/bbonsign/.fnm $PATH
# fnm env --multi | source
# ghcup-env

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f /Users/bbonsign/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /Users/bbonsign/.ghcup/bin $PATH
