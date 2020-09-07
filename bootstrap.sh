#!/bin/bash

echo "Updating pacman packages and databases..."
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

echo "Installing vim-plug..."
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "Done!"

echo "Installing ohmyzsh!..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Done!"

echo "Installing inertia zsh theme..."
  git clone https://github.com/josepmdc/inertia.git $HOME/dev/inertia
  ln -s "$HOME/dev/inertia/inertia.zsh-theme" "$ZSH_CUSTOM/themes/inertia.zsh-theme"
echo "Done!"

echo "Installing i3..."
  read -p "Install with rounded corners support? (y/N): " confirm

  if [[ "$confirm" =~ ^([yY][eE][sS]|[yY])$ ]]; then  
    mkdir -p ~/dev && cd ~/dev/

    git clone https://github.com/josepmdc/i3.git i3-gaps
    cd i3-gaps

    # compile & install
    autoreconf --force --install
    rm -rf build/
    mkdir -p build && cd build/
    
    ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
    make && sudo make install
  else
    sudo pacman -S i3
  fi

echo "Done!"
