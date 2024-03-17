#!/bin/sh

# Function to check if a command exists
command_exists() {
	command -v "$1" >/dev/null 2>&1
}

# Ensure gh (GitHub CLI) is installed
if ! command_exists gh; then
	echo "GitHub CLI (gh) is not installed. Attempting to install it..."
	# Assuming you have a script named github-cli.sh that installs gh
	./github-cli.sh
	if [ $? -ne 0 ]; then
		echo "Failed to install GitHub CLI (gh). Please install it manually and try again."
		exit 1
	fi
fi

# Function to download and extract fonts from a URL
download_and_extract_fonts_from_url() {
	local url=$1
	local pattern=$2
	local font_dir=$3

	mkdir -p "$font_dir"

	local filename=$(basename "$url")

	echo "Downloading from $url..."
	curl -L -o "/tmp/$filename" "$url"
	if [ $? -ne 0 ]; then
		echo "Failed to download from $url."
		exit 1
	fi

	echo "Extracting $pattern to $font_dir..."
	unzip -j "/tmp/$filename" "$pattern" -d "$font_dir" -n
	if [ $? -ne 0 ]; then
		echo "Failed to extract $pattern to $font_dir."
		exit 1
	fi

	echo "Cleaning up..."
	rm "/tmp/$filename"
}

# Function to download and extract fonts
download_and_extract_fonts_from_repo() {
	local repo=$1
	local pattern=$2
	local font_dir=$3

	mkdir -p "$font_dir"

	echo "Downloading $pattern from $repo..."
	gh release download -R "$repo" -p "$pattern" -D /tmp --clobber
	if [ $? -ne 0 ]; then
		echo "Failed to download $pattern from $repo."
		exit 1
	fi

	echo "Extracting $pattern to $font_dir..."
	unzip -j /tmp/"$pattern" '*' -d "$font_dir" -n
	if [ $? -ne 0 ]; then
		echo "Failed to extract $pattern to $font_dir."
		exit 1
	fi

	echo "Cleaning up..."
	rm /tmp/"$pattern"
}

# Download and extract Clear Sans font
download_and_extract_fonts_from_url "https://api.fontsource.org/v1/download/clear-sans" "*" ~/.local/share/fonts/clear-sans

# Download and extract Clear Sans font
download_and_extract_fonts_from_url "https://api.fontsource.org/v1/download/cantarell" "*" ~/.local/share/fonts/cantarell

# Download and extract Work Sans font
download_and_extract_fonts_from_url "https://github.com/weiweihuanghuang/Work-Sans/archive/master.zip" "*wght*.ttf" ~/.local/share/fonts/work-sans

# Download and extract Intel One Mono Nerd Font
download_and_extract_fonts_from_repo "ryanoasis/nerd-fonts" "IntelOneMono.zip" ~/.local/share/fonts/intel-one-mono

echo "Fonts downloaded and extracted successfully."
