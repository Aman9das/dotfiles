#!/bin/sh

# Download the Clear Sans font archive
wget https://api.fontsource.org/v1/download/clear-sans -O clear-sans.zip
unzip -j clear-sans.zip 'ttf/*' -d ~/.local/share/fonts/clear-sans
rm clear-sans.zip

# Download the Intel One Mono Nerd Font font archive
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/IntelOneMono.zip -O intel-one-mono.zip
unzip intel-one-mono.zip "IntoneMonoNerdFont-*" -d ~/.local/share/fonts/intel-one-mono
rm intel-one-mono.zip
