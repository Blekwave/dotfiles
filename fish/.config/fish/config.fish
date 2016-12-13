# Blek's fishy fish configs
# Use with caution. Made for GNU Stow.

set -g -x fish_greeting ''

# Add /usr/local/bin/ to path

set -g -x PATH /usr/local/bin $PATH

# Load code on startup
set includes_dir $HOME/.config/fish/include
for file in $includes_dir/*.fish
    . $file
end

# Start X at login
if status --is-login
    if [ $XDG_VTNR ]
        if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
            exec startx -- -keeptty
        end
    end
end

set -g fish_prompt_pwd_dir_length 6

set -gx TERM xterm-256color
