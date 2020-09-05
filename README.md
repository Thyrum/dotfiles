Dotfiles
========
This is my collection of [configuration files](http://dotfiles.github.io/).

Usage
-----
Pull the repository and then create symbolic links using
[GNU stow](https://www.gnu.org/software/stow/)
```bash
$ git clone git@github.com:Thyrum/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ stow zsh neovim tmux # and whatever other config you'd like
```
