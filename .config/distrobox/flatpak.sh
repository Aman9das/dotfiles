#!/bin/bash

# Define the main function which will contain your code
main() {
	# Your code goes here
	if [ -f "/etc/fedora-release" ]; then
		# Fedora commands here
		sudo dnf install flatpak-builder -y
	elif [ -f "/etc/debian_version" ]; then
		# Debian-based commands here
		sudo apt-get install flatpak-builder -y
	elif [ -f "/etc/os-release" ] && grep -q "Wolfi" /etc/os-release; then
		# Wolfi commands here
		# Attempt to install flatpak-builder using apk
		sudo apk add flatpak-builder
	else
		echo "Unsupported distribution."
		exit 1
	fi
}

# Call the main function
main

# EOF
exit 0
