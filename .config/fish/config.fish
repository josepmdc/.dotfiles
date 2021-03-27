# remove greeting message
set fish_greeting

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

alias dotfiles='/usr/bin/git --git-dir=/home/josepm/.dotfiles/ --work-tree=/home/josepm'
alias vi='nvim'
alias ls='exa'
alias la='exa -la'
alias zathura='zathura --fork'
alias ssh='TERM=xterm-256color command ssh'
