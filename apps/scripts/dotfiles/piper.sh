echo "Downloading piper_linux_x86_64.tar.gz from GitHub..."
gh release download -R "rhasspy/piper" --pattern \
	"piper_linux_x86_64.tar.gz" -D /tmp --clobber

echo "Extracting tarball to ~/app/programs..."
tar -xzf /tmp/piper_linux_x86_64.tar.gz -C ~/apps/programs

echo "Removing downloaded tarball..."
rm /tmp/piper_linux_x86_64.tar.gz

echo "Symlinking piper binary to ~/.local/bin..."
ln -sf ~/apps/programs/piper/piper ~/.local/bin/piper
