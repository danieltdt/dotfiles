My dotfiles
-----------

My dotfiles for linux development environment.

Includes
  * bash files
  * git files
  * neovim files
  * powerline files
  * ruby files
  * clojure files


## Requirements

  * direnv
  * ncurses (tput)


## Usage

```sh
    git clone git@github.com:danieltdt/dotfiles.git
    cd dotfiles
    #
    # Install required dependencies
    #
    #   sudo pacman -S ncurses # for archlinux
    #
    # or
    #
    #   brew install bash-completion ncurses # for macos
    #
    # Install optional dependencies
    #
    # rbenv; ruby-build; nvm; pyenv; git; python2; tmux; neovim; vim-plug
    #
    # Create symlinks
    rbenv exec ruby install.rb
```
