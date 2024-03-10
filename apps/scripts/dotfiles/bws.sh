#!/bin/bash

# Function to check if a command exists
command_exists() {
	command -v "$1" >/dev/null 2>&1
}

# Function to install bws using gh
install_bws_with_gh() {
	local repo="bitwarden/sdk"
	local pattern="bws-x86_64-unknown-linux-gnu-*"
	local download_url
	local install_dir="$HOME/apps/programs/bitwarden"
	local bin_dir="$HOME/.local/bin"

	echo "Fetching the latest release download URL for bws from $repo..."
	download_url=$(gh release view --repo "$repo" --json assets --jq ".assets[] | select(.name | test(\"$pattern\")) | .url" | head -n 1)

	if [ -z "$download_url" ]; then
		echo "Could not find a suitable release asset for bws."
		return 1
	fi

	echo "Downloading bws from $download_url..."
	gh release download --repo "$repo" --pattern "$pattern" --dir /tmp

	echo "Extracting bws to $install_dir..."
	unzip -o /tmp/bws.zip -d "$install_dir" >/dev/null 2>&1

	echo "Creating a symbolic link to bws in $bin_dir..."
	ln -s "$install_dir/bws" "$bin_dir/bws" -f

	echo "Removing the downloaded zip file..."
	rm /tmp/bws.zip

	echo "bws has been installed successfully."
}

# Function to install bws using old method
install_bws_old_method() {
	local download_url="https://github.com/bitwarden/sdk/releases/latest/download/bws-x86_64-unknown-linux-gnu.zip"
	local install_dir="$HOME/apps/programs/bitwarden"
	local bin_dir="$HOME/.local/bin"

	echo "Downloading bws from $download_url..."
	curl -L "$download_url" -o /tmp/bws.zip

	echo "Extracting bws to $install_dir..."
	unzip -o /tmp/bws.zip -d "$install_dir" >/dev/null 2>&1

	echo "Creating a symbolic link to bws in $bin_dir..."
	ln -s "$install_dir/bws" "$bin_dir/bws" -f

	echo "Removing the downloaded zip file..."
	rm /tmp/bws.zip

	echo "bws has been installed successfully."
}

# Ensure gh (GitHub CLI) is installed
if ! command_exists gh; then
	echo "GitHub CLI (gh) is not installed. Attempting to install it..."
	# Assuming you have a script named github-cli.sh that installs gh
	./github-cli.sh
	if [ $? -ne 0 ]; then
		echo "Failed to install GitHub CLI (gh). Attempting to install bws using old method..."
		install_bws_old_method
		exit 1
	fi
fi

# Install bws using gh
install_bws_with_gh || {
	echo "Failed to install bws using gh. Attempting to install bws using old method..."
	install_bws_old_method
}
