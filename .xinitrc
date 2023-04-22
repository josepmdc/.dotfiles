export EDITOR=nvim
export TERMINAL=xterm-kitty

export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/scripts

numlockx &
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

exec i3
