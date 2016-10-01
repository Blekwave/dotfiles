# Loads virtualfish if it's installed

set setup_commands (python -m virtualfish ^/dev/null)

if [ $setup_commands ]
    eval $setup_commands
end
