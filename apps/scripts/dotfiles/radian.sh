#!/bin/bash

# Function to check if a command exists
command_exists() {
	command -v "$1" >/dev/null 2>&1
}

# Ensure brew is installed
if ! command_exists brew; then
	echo "Homebrew is not installed. Attempting to install it..."
	# Assuming you have a script named brew.sh that installs brew
	./brew.sh
	if [ $? -ne 0 ]; then
		echo "Failed to install Homebrew. Please install it manually and try again."
		exit 1
	fi
fi

# Check if pipx command is available and install radian with force mode
if ! command_exists pipx; then
	echo "Pipx command not found. Installing..."
	brew install pipx
fi

echo "Installing radian with force mode..."
pipx install radian --force

# Remove radian symlink
if [ -L ~/.local/bin/radian ]; then
	echo "Removing native symlink for radian..."
	rm ~/.local/bin/radian
fi

# Export radian binary to distrobox with R installed
echo "Exporting radian binary through distrobox with R installed"
distrobox-enter rbox -e 'distrobox-export -b ~/.local/share/pipx/venvs/radian/bin/radian'

echo "radian has been installed and exported successfully."
