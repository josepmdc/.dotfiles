#!/bin/bash

echo "Updating pacman packages and databases..."
    sudo pacman -Syu
echo "Done!"

echo "Installing pacman packages..."
sudo pacman -S \
    alacritty kitty firefox chromium neovim code dmenu rofi redshift \
    flameshot i3lock hugo nodejs go rustup python vlc git nautilus \
    vifm feh picom bat ripgrep playerctl exa i3 network-manager-applet \
    zathura zathura-pdf-mupdf texlive-most base-devel polybar fish \
    xclip noto-fonts-cjk noto-fonts-emoji noto-fonts ttf-fira-code
echo "Done!"

echo "Installing yay..."
    git clone https://aur.archlinux.org/paru.git
  cd yay
  makepkg -si
echo "Done!"
