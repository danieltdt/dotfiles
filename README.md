My dotfiles
-----------

My dotfiles for Ubuntu development environment.

Includes
  * bash files
  * vim files
  * git files
  * ruby files (bundler, rspec, gemrc, rdebug)
  * python files (actually, powerline extensions)
  * tmux
  * libgit2
  * pygit2
  * powerline on vim
  * powerline on bash
  * powerline on tmux

## Requirements

To run `install.rb` you need [Ruby](https://github.com/sstephenson/rbenv).

## Usage

    git clone git@github.com:danieltdt/dotfiles.git
    cd dotfiles
    git submodule update --init --recursive
    ./install.rb
