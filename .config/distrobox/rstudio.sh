#!/bin/bash
 
# Define the main function which will contain your code
main() {
    # Your code goes here
    if [ -f "/etc/fedora-release" ]; then
        # Fedora commands here
        sudo dnf install 'dnf-command(versionlock)' -y
        sudo dnf versionlock delete rstudio
        sudo dnf copr enable iucar/cran -y
        sudo dnf install R-CoprManager -y
        sudo dnf install https://rstudio.org/download/latest/stable/desktop/rhel9/rstudio-latest-x86_64.rpm -y
        sudo dnf versionlock add rstudio
    else
        if [ -f "/etc/debian_version" ]; then
            # Debian-based commands here
            TEMP_DEB="$(mktemp)" &&
            wget -O "$TEMP_DEB" 'https://rstudio.org/download/latest/stable/desktop/jammy/rstudio-latest-amd64.deb' &&
            sudo apt install "$TEMP_DEB"
            rm -f "$TEMP_DEB"
        fi
    fi
}

# Call the main function
main

# Add additional functions and calls as necessary

# EOF
exit 0
