starship init fish | source
source ~/.config/nnn/nnn_env_vars
source ~/.config/fish/colors/fish_tokyonight_storm.fish


function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert
    fzf_key_bindings --variables=\e\cv --git_log=\e\cg &>/dev/null
    fzf_configure_bindings --variables=\e\cv --git_log=\e\cg &>/dev/null
end

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block
set fish_cursor_visual block

set -g fish_escape_delay_ms 10

# bgcolor of the current tab completion selection
set fish_color_search_match --background=4b719c


set -xg PAGER 'bat --plain'
set -xg EDITOR lvim
set -xg VISUAL lvim
# CTRL-x opens EDITOR for editing long commands (C-x C-x in tmux)
# Note: Alt-e and Alt-v also open EDITOR for editing commands
bind \cx edit_command_buffer

# open man pages in neovim
set -xg MANPAGER 'lvim +Man!'


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



if command -v pyenv 1>/dev/null 2>&1
    pyenv init - | source
end

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



 set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
 # if status --is-interactive
 #     keychain --eval --quiet --quick qlair_bitbucket | source
 # end


# if command -sq gls
#     function ls --description "ls command of GNU coreutils"
#         set -l param --color=auto
#         if isatty 1
#             set param $param --indicator-style=classify --group-directories-first
#         end
#         command gls -h $param $argv
#     end

#     if not set -q LS_COLORS
#         if command -sq gdircolors
#             set -l colorfile
#             for file in ~/.dir_colors ~/.dircolors
#                 if test -f $file
#                     set colorfile $file
#                     break
#                 end
#             end
#             set -gx LS_COLORS (gdircolors -c $colorfile | string split ' ')[3]
#             if string match -qr '^([\'"]).*\1$' -- $LS_COLORS
#                 set LS_COLORS (string match -r '^.(.*).$' $LS_COLORS)[2]
#             end
#         end
#     end
# end
