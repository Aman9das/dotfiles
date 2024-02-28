curl -sL $(curl -s https://api.github.com/repos/bitwarden/sdk/releases/latest | grep browser_download_url | cut -d\" -f4 | grep -E 'bws-x86_64-unknown-linux-gnu-*') -o /tmp/bws.zip
unzip -o /tmp/bws.zip -d "$HOME/apps/programs/bitwarden/" >/dev/null 2>&1
ln -s "$HOME/apps/programs/bitwarden/bws" "$HOME/.local/bin/bws" -f
