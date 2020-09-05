#   ________
#  /_  __/ /_  __  _________  ______ ___
#   / / / __ \/ / / / ___/ / / / __ `__ \
#  / / / / / / /_/ / /  / /_/ / / / / / /
# /_/ /_/ /_/\__, /_/   \__,_/_/ /_/ /_/
#           /____/
#
# Filename:   .zprofile
# Github:     https://github.com/Thyrum/dotfiles
# Maintainer: Thyrum (Aron de Jong)

export PATH=$PATH:$HOME/.scripts/bin:$HOME/.local/bin

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
export BC_ENV_ARGS="$HOME/.config/bc.conf"

setopt autocd

if [ "$(tty)" = "/dev/tty1" ]; then
	exec sway
fi
