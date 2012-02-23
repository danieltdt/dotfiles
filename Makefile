PWD ?= `pwd`
HOME ?= `echo $$HOME`
BASH_ALIASES	= .bash_aliases
BASHRC		= .bashrc
BASH_PROFILE	= .bash_profile
GEMRC		= .gemrc
GITCONFIG	= .gitconfig
GITIGNORE	= .gitignore
RDEBUGRC	= .rdebugrc

backupfiles:
	mkdir -p ${HOME}/.dotfiles.old 2> /dev/null
	mv -f ${HOME}/${BASH_ALIASES} ${HOME}/.dotfiles.old 2> /dev/null
	mv -f ${HOME}/${BASHRC} ${HOME}/.dotfiles.old 2> /dev/null
	mv -f ${HOME}/${BASH_PROFILE} ${HOME}/.dotfiles.old 2> /dev/null
	mv -f ${HOME}/${GEMRC} ${HOME}/.dotfiles.old 2> /dev/null
	mv -f ${HOME}/${GITCONFIG} ${HOME}/.dotfiles.old 2> /dev/null
	mv -f ${HOME}/${GITIGNORE} ${HOME}/.dotfiles.old 2> /dev/null
	mv -f ${HOME}/${RDEBUGRC} ${HOME}/.dotfiles.old 2> /dev/null

symlinks:
	ln -s ${PWD}/${BASH_ALIASES} ${HOME}/${BASH_ALIASES}
	ln -s ${PWD}/${BASHRC} ${HOME}/${BASHRC}
	ln -s ${PWD}/${BASH_PROFILE} ${HOME}/${BASH_PROFILE}
	ln -s ${PWD}/${GEMRC} ${HOME}/${GEMRC}
	ln -s ${PWD}/${GITCONFIG} ${HOME}/${GITCONFIG}
	ln -s ${PWD}/${GITIGNORE} ${HOME}/${GITIGNORE}
	ln -s ${PWD}/${RDEBUGRC} ${HOME}/${RDEBUGRC}

install: backupfiles symlinks
