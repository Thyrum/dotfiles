#   ________
#  /_  __/ /_  __  _________  ______ ___
#   / / / __ \/ / / / ___/ / / / __ `__ \
#  / / / / / / /_/ / /  / /_/ / / / / / /
# /_/ /_/ /_/\__, /_/   \__,_/_/ /_/ /_/
#           /____/
#
# Filename:   .config/zsh/.zshrc
# Github:     https://github.com/Thyrum/dotfiles
# Maintainer: Thyrum (Aron de Jong)

# Config for ZSH shell


# Fallback to `xterm-256color` if terminal is not recognized
if [ -z "$(find /usr/share/terminfo -type f -name \"$TERM\" 2>/dev/null)" ]; then
	export TERM=xterm-256color
fi

# Enable colors and change prompt:
autoload -U colors && colors

# Prompt config
source $DOTFILES/zsh/.config/git-prompt.sh

PS_GIT='$(__git_ps1 " %%{$fg[cyan]%%}(%s)")'
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=1

PS_HOSTNAME=''
[ -n "${SSH_CLIENT}${SSH_TTY}${SSH_CONNECTION}" ] && PS_HOSTNAME='%{$fg[green]%}@%{$fg[yellow]%}%m'

PS_CHAR='%{$reset_color%}%(!.#.\$)'
PS_DIR='%{$fg[magenta]%}%c'
PS_NAME='%{$fg[blue]%}%n'

setopt PROMPT_SUBST
PS1='%B%{$fg[red]%}['$PS_NAME''$PS_HOSTNAME' '$PS_DIR'%{$fg[red]%}]'$PS_GIT''$PS_CHAR'%b '

unset PS_GIT PS_HOSTNAME PS_CHAR PS_DIR PS_NAME

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# vi mode
bindkey -v
bindkey -a '^[[3~' delete-char
bindkey '^[[3~' delete-char
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"



# Load zsh-syntax-highlighting; should be last.
[ -n "$DOTFILES" ] && source $DOTFILES/zsh/.config/zsh/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh
[ -n "$DOTFILES" ] && source $DOTFILES/zsh/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# FZF after syntax highlighting for CTRL-R binding
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -n "$startup" ] && exec $startup
