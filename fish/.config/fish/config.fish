# Blek's fishy fish configs
# Use with caution. Made for GNU Stow.

set -g -x fish_greeting ''

# Load code on startup
set includes_dir $HOME/.config/fish/include
for file in $includes_dir/*.fish
    . $file
end

# Initialize ssh-agent
start_agent

