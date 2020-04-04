# dotfiles

## How to set up

### 1. If you want to use this config
Clone the repo in your HOME directory:
```
git clone https://github.com/josepmdc/dotfiles.git
```

Define an alias so you can manage your dotfiles from any directory (change bashrc for zshrc if you are using zsh):
```
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
```

Checkout the files in your HOME directory if you cloned my repo:
```
dotfiles checkout
```

### 2. If you want to manage your own

create a git bare repo:
```
git init --bare $HOME/.dotfiles
```

Define an alias so you can manage your dotfiles from any directory (change bashrc for zshrc if you are using zsh):
```
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
```

Set git config to hide untracked files
```
dotfiles config --local status.showUntrackedFiles no
```

## Adding new files

If you want to add new file you can just use
```
dotfiles add <file path>
```
and commit your changes with 
```
dotfiles commit -m "Commit message"
```
