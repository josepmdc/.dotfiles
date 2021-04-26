# Path to your oh-my-zsh installation.
export ZSH="/home/josepm/.oh-my-zsh"
export VIRTUAL_ENV_DISABLE_PROMPT=

ZSH_THEME="inertia"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

plugins=(
	git
	colorize
)

source $ZSH/oh-my-zsh.sh

# Git promt {{{
# autoload -Uz vcs_info
# zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:*' formats "%F{010}(%b)%f "
# precmd() { vcs_info }
# setopt prompt_subst
# PROMPT='%F{214}%1d %F{226}\$%f ${vcs_info_msg_0_} '
# }}}

alias dotfiles='/usr/bin/git --git-dir=/home/josepm/.dotfiles/ --work-tree=/home/josepm'
alias search='fn(){ firefox -new-tab "https://google.com/search?q=$1"};fn'
alias yt='fn(){ firefox -new-tab "https://youtube.com/results?search_query=$1"};fn'
alias ffnt='fn(){ firefox -new-tab $1};fn'
alias vi='nvim'
alias ls='exa'
alias la='exa -la'
alias zathura='zathura --fork'
alias ssh='TERM=xterm-256color ssh'

# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'

# Enable vi mode
bindkey -v

# Accept autocomplete suggestion with CTRL + space
bindkey '^ ' autosuggest-accept

# Set title to current dir or program that's running {
    function set-title-precmd() {
      printf "\e]2;%s\a" "${PWD/#$HOME/~}"
    }

    function set-title-preexec() {
      printf "\e]2;%s\a" "$1"
    }
    
    autoload -Uz add-zsh-hook
    add-zsh-hook precmd set-title-precmd
    add-zsh-hook preexec set-title-preexec
# }

# plugins {{{
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# }}
