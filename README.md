# dotfiles

## How to set up

### 1. If you want to use this config
Clone the repo in your HOME directory:
```
git clone https://github.com/josepmdc/dotfiles.git
```

Define an alias so you can manage your dotfiles from any directory (NOTE: Notice this writes an alias to the .zshrc file, change it if you are using another shell):
```
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```

Checkout the files in your HOME directory:
```
dotfiles checkout
```

### 2. If you want to manage your own

create a git bare repo:
```
git init --bare $HOME/.dotfiles
```

Define an alias so you can manage your dotfiles from any directory (NOTE: Notice this writes an alias to the .zshrc file, change it if you are using another shell):
```
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
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
