# Check if Lucida and Intone are in the font list
if fc-list | grep -q Lucida && fc-list | grep -q Intone; then
	exit 0
fi

# Download the Lucas Sans zip file
wget https://www.wfonts.com/download/data/2016/07/08/lucida-sans/lucida-sans.zip
# Unzip the file and extract only LSANS.TTF, removing the rest
unzip -j lucida-sans.zip LSANS.TTF -d /tmp/font
# Move the file to the desired location
mv -n /tmp/font/LSANS.TTF ~/.local/share/fonts/lsans.ttf

# Download the IntelOneMono zip file
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IntelOneMono.zip
# Unzip the file and extract only LSANS.TTF, removing the rest
unzip -j IntelOneMono.zip IntoneMonoNerdFont-Regular.ttf -d /tmp/font
# Move the file to the desired location
mv -n /tmp/font/IntoneMonoNerdFont-Regular.ttf ~/.local/share/fonts/IntoneMonoNerdFont-Regular.ttf

# Update the font cache
sudo fc-cache -f -v

# Clean up the temporary directory
rm -rf /tmp/font
