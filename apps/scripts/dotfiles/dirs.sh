#!/bin/bash

# Update XDG user directories
xdg-user-dirs-update

# Function to rename directories to lowercase
rename_to_lowercase() {
	local dir="$1"
	local base=$(basename "$dir")
	local new_base=$(echo "$base" | tr '[:upper:]' '[:lower:]')
	if [ "$base" != "$new_base" ]; then
		mv --no-clobber -- "$dir" "$(dirname "$dir")/$new_base"
	fi
}

# Export the function so it can be used by find
export -f rename_to_lowercase

# Find directories in the home directory that do not start with a dot and rename them
find "$HOME" -maxdepth 1 -type d ! -name '.*' -exec bash -c 'rename_to_lowercase "$0"' {} \;

echo "Directories renamed to lowercase."
