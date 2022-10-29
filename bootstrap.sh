#!/bin/bash

echo "Updating pacman packages and databases..."
sudo pacman -Syu
echo "Done!"

echo "Installing pacman packages..."
sudo pacman -S \
    kitty firefox neovim dmenu flameshot i3lock  nodejs go rustup python vlc git \
    nautilus vifm feh picom bat ripgrep playerctl exa i3 network-manager-applet \
    zathura zathura-pdf-mupdf texlive-most base-devel polybar fish xclip ttf-fira-code \
    noto-fonts-cjk noto-fonts-emoji noto-fonts
echo "Done!"

echo "Installing yay..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
echo "Done!"

echo "Setting keyboard layout"
localectl set-x11-keymap es, 105, qwerty caps:swapescape
echo "Done!"
