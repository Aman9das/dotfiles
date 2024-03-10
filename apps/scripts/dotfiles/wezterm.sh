#!/bin/bash

# Function to check if a command exists
command_exists() {
	command -v "$1" >/dev/null 2>&1
}

# Ensure brew is installed
if ! command_exists brew; then
	echo "Homebrew is not installed. Attempting to install it..."
	# Assuming you have a script named brew.sh that installs brew
	source brew.sh
	if [ $? -ne 0 ]; then
		echo "Failed to install Homebrew. Please install it manually and try again."
		exit 1
	fi
fi

# Install wezterm via brew
echo "Installing wezterm via brew..."
brew install wezterm

# Symlink wezterm binary to /usr/local/bin
echo "Symlinking wezterm to /usr/local/bin..."
sudo ln -sf "$(brew --prefix wezterm)/bin/wezterm" /usr/local/bin/wezterm

echo "wezterm has been installed and symlinked successfully."
