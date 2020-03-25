# ~/.zprofile

export PATH=$PATH:$HOME/.scripts/bin

# default programs
export TERMINAL=alacritty
export BROWSER=firefox
export EDITOR=nvim
export MOZ_ENABLE_WAYLAND=1

# My directories
export UNI=$HOME/uni
export DOTFILES=$HOME/dotfiles
export XDG_CONFIG_HOME=$HOME/.config

# ~/ Clean-up:
export ZDOTDIR="$HOME/.config/zsh"

if [ "$(tty)" = "/dev/tty1" ]; then
	exec sway
fi
