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

# Fallback to `xterm-256color` if terminal is not recognized
if [ -z "$(find /usr/share/terminfo -type f -name \"$TERM\" 2>/dev/null)" ]; then
	export TERM=xterm-256color
fi

export PATH=$PATH:$HOME/.scripts/bin:$HOME/.local/bin

# default programs
export TERMINAL=alacritty
export BROWSER=firefox
export EDITOR=nvim
export PAGER=less
export MOZ_ENABLE_WAYLAND=1

# My directories
export UNI=$HOME/uni
export DOTFILES=$HOME/.dotfiles
export XDG_CONFIG_HOME=$HOME/.config

# ~/ Clean-up:
export ZDOTDIR="$HOME/.config/zsh"
export BC_ENV_ARGS="$HOME/.config/bc.conf"

# Colored man pages!
# termcap terminfo  
# ks      smkx      make the keypad send commands
# ke      rmkx      make the keypad send digits
# vb      flash     emit visual bell
# mb      blink     start blink
# md      bold      start bold
# me      sgr0      turn off bold, blink and underline
# so      smso      start standout (reverse video)
# se      rmso      stop standout
# us      smul      start underline
# ue      rmul      stop underline
#         setaf     change foreground color
#         setab     change background color
export LESS_TERMCAP_vb=$(tput flash)
export LESS_TERMCAP_mb=$(tput blink)
export LESS_TERMCAP_md=$(tput bold; tput setaf 4)
export LESS_TERMCAP_us=$(tput smul; tput setaf 3)
export LESS_TERMCAP_so=$(tput smso)
export LESS_TERMCAP_ue=$(tput sgr0)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_se=$(tput sgr0)

export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=01;34:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'

setopt autocd

[ -f "$HOME/.localprofile" ] && source $HOME/.localprofile
