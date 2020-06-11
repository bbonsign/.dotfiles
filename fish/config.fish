starship init fish | source

# set PATH <mydir> $PATH

# Shows a preview of the file via bat
set -xg FZF_DEFAULT_OPTS '--height=100% --preview="bat {} --color=always"'
# Use --preview option to display the full command on the preview window.
# Bind ? key for toggling the preview window.
set -xg FZF_CTRL_R_OPTS "--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
# Shows tree of the directory in the preview window
set -xg FZF_ALT_C_OPTS "--preview 'tree -C {} | head -200'"

alias vim=nvim
alias vi=nvim
alias v=nvim

set -xg EDITOR nvim

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


# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end
