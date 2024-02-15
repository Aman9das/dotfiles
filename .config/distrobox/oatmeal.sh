#!/bin/bash

# Define the main function which will contain your code
main() {
    # Your code goes here
    if [ -f "/etc/fedora-release" ]; then
        # Fedora commands here
        dnf config-manager --add-repo https://yum.dustinblackman.com/config.repo
        dnf install oatmeal -y
    elif [ -f "/etc/debian_version" ]; then
        # Debian-based commands here
        curl -s https://apt.dustinblackman.com/KEY.gpg | apt-key add -
        curl -s https://apt.dustinblackman.com/dustinblackman.list > /etc/apt/sources.list.d/dustinblackman.list
        sudo apt-get update
        sudo apt-get install oatmeal -y
    elif grep -q "Wolfi" /etc/os-release; then
        # Wolfi commands here
        arch=$(uname -m | grep -q 'aarch64' && echo 'arm64' || echo 'amd64')
        curl -L -o oatmeal.apk "https://github.com/dustinblackman/oatmeal/releases/download/v0.12.4/oatmeal_0.12.4_linux_${arch}.apk"
        sudo apk add --allow-untrusted ./oatmeal.apk
    else
        echo "Unsupported distribution."
        exit 1
    fi
}

# Call the main function
main

# EOF
exit 0