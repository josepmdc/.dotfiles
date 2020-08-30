#!/bin/bash

echo "Updating pacman packages..."
sudo pacman -Syu
echo "Done!"

echo "Installing pacman packages..."
  sudo pacman -S alacritty firefox chromium neovim code dmenu rofi docker \
                 flameshot i3lock hugo nodejs go rust python vlc git fzf \
                 the_silver_searcher ranger zsh feh
echo "Done!"

echo "Installing yay..."
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
echo "Done!"

echo "Updating pacman packages..."
  sudo pacman -Syu
echo "Done!"

echo "Installing vim-plug..."
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "Done!"

echo "Installing ohmyzsh!..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Done!"

echo "Installing spaceship zsh theme..."
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
  ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" 
echo "Done!"


