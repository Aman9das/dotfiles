# Download the zip file
wget https://www.wfonts.com/download/data/2016/07/08/lucida-sans/lucida-sans.zip

# Unzip the file and extract only LSANS.TTF, removing the rest
unzip -j lucida-sans.zip LSANS.TTF -d /tmp/lsans

# Move the file to the desired location
cp -n /tmp/lsans/LSANS.TTF ~/.local/share/fonts/lsans.ttf

# Move the file to the desired location
sudo mv -n /tmp/lsans/LSANS.TTF /usr/share/fonts/lsans.ttf

# Update the font cache
sudo fc-cache -f -v

# Clean up the temporary directory
rm -rf /tmp/lsans
