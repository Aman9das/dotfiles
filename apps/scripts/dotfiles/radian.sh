#!/bin/bash
# Check if pipx command is available and install radian with force mode, remove radian symlink, and export radian binary to distrobox.

if ! command -v pipx >/dev/null 2>&1; then
	echo "Pipx command not found. Installing..."
	brew install pipx
fi

echo "Installing radian with force mode..."
pipx install radian --force

echo "Removing symlink for radian..."
rm ~/.local/bin/radian

echo "Exporting radian binary to distrobox..."
distrobox-enter rbox -c 'distrobox-export -b ~/.local/share/pipx/venvs/radian/bin/radian'
