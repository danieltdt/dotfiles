PWD ?= `pwd`
HOME ?= `echo $$HOME`
BASH_ALIASES	= .bash_aliases
BASHRC		= .bashrc
GEMRC		= .gemrc
GITCONFIG	= .gitconfig
GITIGNORE	= .gitignore
RDEBUGRC	= .rdebugrc

symlinks:
	ln -s ${PWD}/${BASH_ALIASES} ${HOME}/${BASH_ALIASES}
	ln -s ${PWD}/${BASHRC} ${HOME}/${BASHRC}
	ln -s ${PWD}/${GEMRC} ${HOME}/${GEMRC}
	ln -s ${PWD}/${GITCONFIG} ${HOME}/${GITCONFIG}
	ln -s ${PWD}/${GITIGNORE} ${HOME}/${GITIGNORE}
	ln -s ${PWD}/${RDEBUGRC} ${HOME}/${RDEBUGRC}
