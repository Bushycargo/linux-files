#!/bin/bash

echo Starting Install

while getopts ":b:s" opt; do
	case $opt in
		b)
			cat bashrcAppend >> ~/.bashrc
			echo "Appended .bashrc" >&2
		;;
		s)
			cp -r scripts/* ~/
			echo "Updated Scripts. Install Finished" >&2
			exit 0
		;;
		\?)
			echo "Error invalid flag: -$OPTARG" >&2
			exit 0
		;;
	esac
done

sudo pacman -S feh compton rofi i3-wm i3lock i3status

mkdir ~/.config/i3 || true
mkdir ~/scripts || true

cp -i config ~/.config/i3/
cp background.jgp ~/.config/i3/
cp background.png ~/.config.i3/
cp -r scripts/* ~/

chmod +x ~/scripts/*

echo Install Done!
