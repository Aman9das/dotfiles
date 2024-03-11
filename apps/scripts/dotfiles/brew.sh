#!/bin/bash

# Function to check if a command exists in PATH
command_exists() {
	command -v "$1" >/dev/null 2>&1
}

# Check if brew is in PATH
if command_exists brew; then
	echo "Homebrew is already installed and in PATH."
else
	if command_exists ujust; then
		echo "ujust is in PATH, but Homebrew is not installed."
		echo "Attempting to install Homebrew using ujust..."
		ujust brew
		if [ $? -ne 0 ]; then
			echo "Failed to install Homebrew using ujust."
			exit 1
		fi
	else
		echo "Neither brew nor ujust is in PATH. Installing Homebrew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		if [ $? -ne 0 ]; then
			echo "Failed to install Homebrew."
			exit 1
		fi
	fi
fi

# Restore Backup
echo "Restoring Homebrew packages from Brewfile..."
brew bundle
if [ $? -ne 0 ]; then
	echo "Failed to restore Homebrew packages from Brewfile."
	exit 1
fi

echo "Homebrew setup and package restoration completed successfully."
