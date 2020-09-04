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
[Install Dependencies](#dependencies)

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

To install dependencies run the bootstrap.sh script
```bash
./bootstrap.sh
```
NOTE: To get the rounded borders you need to build and install from source from [this fork](https://github.com/josepmdc/i3), since it's not supported by i3 gaps

##### Desktop enviroment
| Name | Description |
|------|-------------|
| i3   | Window manager |
| polybar | Status bar  |
| i3lock | Screen locker |
| feh | For setting the wallpaper |

##### Application launchers
| Name | Description |
|------|-------------|
| dmenu | Small application launcher  | 
| rofi  | window switcher, application launcher and dmenu replacement |

##### File explorers
| Name | Description |
|------|-------------|
| ranger | TUI file explorer |
| nautilus| GUI file explorer |

##### Screenshots
| Name | Description |
|------|-------------|
| flameshot | Powerful screenshot software |

##### Terminal
| Name | Description |
|------|-------------|
| alacritty | Simple and fast terminal emulator | 

##### Shell
| Name | Description |
|------|-------------|
| zsh  |  shell |
| oh my zsh! | zsh framework |
| spaceship | zsh theme |

##### Browsers
| Name | Description |
|------|-------------|
| Firefox |  •ᴗ• |
| Chromium |  (☞ﾟヮﾟ)☞ |

##### Editors
| Name | Description |
|------|-------------|
| neovim | Terminal text editor |
| code oss | Open source VSCode |

##### Programming languages
| Name | Description |
|------|-------------|
| nodejs | ツ |
| go | ٩( ᐛ )و|
| rust | (/•-•)/ |
| python | (＾∇＾) |

##### Source control
| Name | Description |
|------|-------------|
| git | ʘ‿ʘ |

##### Miscellaneous development tools
| Name | Description |
|------|-------------|
| docker | Containers |
| hugo | Static site generator |

##### Media player
| Name | Description |
|------|-------------|
| vlc | ◕‿◕ |

##### Fuzzy finders
| Name | Description |
|------|-------------|
| fzf | file fuzzy finder, I mostly used it in vim |
| the_silver_searcher | Code searching tool, also, I use it mostly in vim |

<a name="shortcuts"/>

## Keyboard shortcuts

Coming soon
