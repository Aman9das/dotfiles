#!/bin/bash

# Function to check if Homebrew is installed
function is_homebrew_installed() {
	if command -v brew >/dev/null 2>&1; then
		echo "Homebrew is installed."
		return 0
	else
		echo "Homebrew is not installed."
		return 1
	fi
}

# Function to install GitHub CLI using Homebrew
function install_with_homebrew() {
	echo "Attempting to install GitHub CLI using Homebrew..."
	brew install gh
	if [ $? -eq 0 ]; then
		echo "GitHub CLI installed successfully via Homebrew."
	else
		echo "Failed to install GitHub CLI via Homebrew."
		return 1
	fi
}

# Function to install Homebrew
function install_homebrew() {
	echo "Homebrew is not installed. Attempting to install Homebrew..."
	# Assuming you have a script named brew.sh that installs Homebrew
	./brew.sh
	if [ $? -eq 0 ]; then
		echo "Homebrew installed successfully."
		return 0
	else
		echo "Failed to install Homebrew."
		return 1
	fi
}

# Main script logic
if is_homebrew_installed; then
	install_with_homebrew
else
	install_homebrew || {
		echo "Failed to install Homebrew. Please install Homebrew manually and try again."
		exit 1
	}
	# After installing Homebrew, try to install gh again
	install_with_homebrew || {
		echo "Failed to install GitHub CLI via Homebrew after installing Homebrew. Please try again."
		exit 1
	}
fi
