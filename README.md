# dotfiles

##### Table of Contents  
1. [How to set up](#setup)  
2. [Adding new files](#adding_files)  
3. [Dependencies](#dependencies)
4. [Keyboard shortcuts](#shortcuts)

## Screenshots

![alt text](https://github.com/josepmdc/dotfiles/blob/master/screenshots/desktop.png?raw=true)

<a name="setup"/>

## How to set up

#### 1. If you want to use this config
Clone the repo in your HOME directory:
```bash
git clone https://github.com/josepmdc/dotfiles.git
```

Define an alias so you can manage your dotfiles from any directory (NOTE: Notice this writes an alias to the .zshrc file, change it if you are using another shell):
```bash
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```

Checkout the files in your HOME directory:
```bash
dotfiles checkout
```
Run the bootstrap.sh script to install dependencies
```bash
./bootstrap.sh
```

#### 2. If you want to manage your own

create a git bare repo:
```bash
git init --bare $HOME/.dotfiles
```

Define an alias so you can manage your dotfiles from any directory (NOTE: Notice this writes an alias to the .zshrc file, change it if you are using another shell):
```bash
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```

Set git config to hide untracked files
```bash
dotfiles config --local status.showUntrackedFiles no
```

<a name="adding_files"/>

## Adding new files

If you want to add new file you can just use
```bash
dotfiles add <file path>
```
and commit your changes with 
```bash
dotfiles commit -m "Commit message"
```

<a name="dependencies"/>

## Dependencies

##### Desktop enviroment
i3, polybar, i3lock, feh

##### Application launchers
dmenu, rofi

##### File explorers
ranger, nautilus

##### Screenshots
flameshot

##### Terminal
alacritty 

##### Shell
zsh with spaceship theme, oh my zsh!

##### Browsers
firefox, chromium 

##### Editors
neovim, code oss

##### Programming languages
nodejs, go, rust, python

##### Source control
git

##### Miscellaneous development tools
docker, hugo

##### Media player
vlc

##### Fuzzy finders
fzf, the_silver_searcher

<a name="shortcuts"/>

## Keyboard shortcuts

Coming soon
