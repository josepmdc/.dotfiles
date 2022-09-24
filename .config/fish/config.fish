# remove greeting message
set fish_greeting

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty >/dev/null 2>&1
    end
end

# autocomplete with ctrl+space in vi insert mode
bind -M insert -k nul forward-char

alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vi='nvim'
alias ls='exa'
alias la='exa -la'
alias zathura='zathura --fork'
alias ssh='TERM=xterm-256color command ssh'
alias vig='nvim -c G'
alias cal='cal -m'

function timer
  sleep $argv &&
  notify-send "Time's Up"
  echo "timer set for $argv"
end
