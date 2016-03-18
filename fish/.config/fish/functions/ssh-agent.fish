function ssh-agent
    keychain --eval --quiet -Q id_rsa | source
end
