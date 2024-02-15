#!/bin/bash

# Define the main function which will contain your code
main() {
    # Your code goes here
    if [ -f "/etc/fedora-release" ]; then
        # Fedora commands here
        sudo dnf copr enable atim/lazygit -y
        sudo dnf install lazygit -y
    elif [ -f "/etc/debian_version" ]; then
        # Debian-based commands here
        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        tar xf lazygit.tar.gz lazygit
        sudo install lazygit /usr/local/bin
    elif [ -f "/etc/os-release" ] && grep -q "Wolfi" /etc/os-release; then
        # Wolfi commands here
        # Attempt to install brew using apk
        sudo apk add brew
        # Attempt to install lazygit using brew
        brew install jesseduffield/lazygit/lazygit
    else
        echo "Unsupported distribution."
        exit 1
    fi
}

# Call the main function
main

# EOF
exit 0