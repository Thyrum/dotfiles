# ~/.zprofile

export PATH=$PATH:$HOME/.scripts/bin

# default programs
export TERMINAL=termite
export BROWSER=firefox
export EDITOR=nvim

# My directories
export UNI=$HOME/uni
export DOTFILES=$HOME/dotfiles
export XDG_CONFIG_HOME=$HOME/.config

# ~/ Clean-up:
export ZDOTDIR="$HOME/.config/zsh"

if [ "$(tty)" = "/dev/tty1" ]; then
	exec startx
fi
