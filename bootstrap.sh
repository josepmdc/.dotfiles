#!/bin/bash

echo "Updating pacman packages and databases..."
sudo pacman -Syu
echo "Done!"

echo "Installing pacman packages..."
sudo pacman -S \
    kitty
    firefox
    neovim
    dmenu
    flameshot
    grim # required by flameshot on wayland
    i3lock
    nodejs
    go
    rustup
    python
    vlc
    mpv
    git
    nautilus
    vifm
    feh
    picom
    bat
    ripgrep
    playerctl
    exa
    network-manager-applet
    zathura
    zathura-pdf-mupdf
    base-devel
    polybar
    fish
    xclip
    wl-clipboard
    ttf-fira-code
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts
    brightnessctl
    wireplumber
    pipewire-{jack,alsa,pulse}
    gsfonts
    wofi
    waybar
    hyprland
    hyprpaper
    hyprlock
    hypridle
    hyprpolkitagent
    papirus-icon-theme
echo "Done!"

echo "Installing yay..."

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

echo "Done!"

echo "Setting up .dotfiles"

git clone --bare https://github.com/josepmdc/dotfiles.git $HOME/.dotfiles
dots='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
$dots checkout
$dots config --local status.showUntrackedFiles no

echo "Done!"

# echo "Setting keyboard layout"
# localectl set-x11-keymap es, 105, qwerty caps:swapescape
# echo "Done!"

echo "Adding user to video group (required to run light without sudo)"
sudo usermod -a -G video $USER
echo "Done!"
