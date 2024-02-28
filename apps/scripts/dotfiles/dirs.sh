#! /usr/bin/sh

xdg-user-dirs-update

(
	cd $HOME
	zmv -o-i -Q './(*)(/)' './${1:l}'
)
