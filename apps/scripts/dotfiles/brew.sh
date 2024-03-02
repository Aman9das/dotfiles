#!/bin/bash

# Function to check if a command exists in PATH
command_exists() {
	command -v "$1" >/dev/null 2>&1
}

# Check if brew is in PATH
if command_exists brew; then
	echo "brew is in PATH, passing..."
elif command_exists ujust; then
	echo "ujust is in PATH, running ujust brew..."
	ujust brew
else
	echo "Neither brew nor ujust is in PATH, installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Restore Backup
brew bundle
