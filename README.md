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

 [rbenv](https://github.com/sstephenson/rbenv)<br />
 [nvm](https://github.com/creationix/nvm)<br />
 python2 + pip<br />
 git (+ git-contrib)


## Usage

```sh
    git clone git@github.com:danieltdt/dotfiles.git
    cd dotfiles
    git submodule update --init --recursive

    # Install required dependencies
    # ...

    # Create symlinks
    ./install.rb
```
