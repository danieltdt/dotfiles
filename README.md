My dotfiles
-----------

My dotfiles for Ubuntu development environment.

Includes
  * bash files
  * vim files
  * git files
  * ruby files (bundler, rspec, gemrc, rdebug)
  * python files (actually, powerline extensions)
  * powerline (for vim and tmux)


## Requirements

  * [rbenv](https://github.com/sstephenson/rbenv)
  * [nvm](https://github.com/creationix/nvm)
  * [tpm](https://github.com/tmux-plugins/tpm)
  * direnv
  * python2 + pip
  * git (+ git-contrib)


## Usage

```sh
    git clone git@github.com:danieltdt/dotfiles.git
    cd dotfiles
    git submodule update --init --recursive

    # Install required dependencies
    # - $ sudo pacman -S python2 git tmux
    #   or
    # - $ brew install bash-completion git python rbenv tmux ruby-build
    # - go to github and install: nvm, rbenv and tpm

    # Create symlinks
    rbenv exec ruby install.rb
```
