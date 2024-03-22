#! /usr/bin/sh
curl https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage \
      -Lo ~/.local/bin/nvim --create-dirs
chmod u+x ~/.local/bin/nvim
