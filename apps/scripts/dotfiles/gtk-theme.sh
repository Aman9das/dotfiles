#!/bin/bash

# Function to download and extract a theme from a GitHub repository
download_and_extract_theme() {
	local repo_owner="$1"
	local repo_name="$2"
	local theme_pattern="$3"
	local theme_dir="$4"

	# Create the theme directory if it doesn't exist
	mkdir -p "$theme_dir"

	# Download the latest source code as a tarball
	gh release download -R "$repo_owner/$repo_name" -p "$theme_pattern" -D "$theme_dir"

	# Find the downloaded tarball
	local tarball=$(find "$theme_dir" -name "$theme_pattern" -type f -print -quit)

	# Extract the tarball
	if [[ -n "$tarball" ]]; then
		# Determine the extension of the tarball
		local extension="${tarball##*.}"
		case "$extension" in
		gz) tar -xzf "$tarball" -C "$theme_dir" ;;
		xz) tar -xJf "$tarball" -C "$theme_dir" ;;
		*)
			echo "Unsupported tarball extension: $extension"
			exit 1
			;;
		esac
		echo "The theme has been downloaded and extracted to $theme_dir."

		# Remove the tarball after extraction
		rm "$tarball"
		echo "The tarball has been removed."
	else
		echo "No tarball found to extract."
	fi
}

# Main script logic

# Ensure GitHub CLI is installed
./github-cli.sh

# Repository owner and name
REPO_OWNER="lassekongo83"
REPO_NAME="adw-gtk3"
THEME_PATTERN="adw-gtk3*.tar.xz"

# Directory to extract the theme
THEME_DIR="$HOME/.local/share/themes"

# Download and extract the theme
download_and_extract_theme "$REPO_OWNER" "$REPO_NAME" "$THEME_PATTERN" "$THEME_DIR"
