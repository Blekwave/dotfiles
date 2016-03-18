# Blek's fishy fish configs
# Use with caution. Made for GNU Stow.

set -g -x fish_greeting ''

# Load code on startup
set includes_dir $HOME/.config/fish/include
for file in $includes_dir/*.fish
    . $file
end

# Start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
end
