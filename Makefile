PWD ?= `pwd`
HOME ?= `echo $$HOME`
BASH_ALIASES	= .bash_aliases
BASHRC			= .bashrc
BASH_PROFILE	= .bash_profile
BASH_COLORS		= .bash_colors
GEMRC			= .gemrc
GITCONFIG		= .gitconfig
GITIGNORE		= .gitignore
RDEBUGRC		= .rdebugrc
VIMRC			= .vimrc
BUNDLE			= .bundle
RSPEC			= .rspec

backupfiles:
	mkdir -p ${HOME}/.dotfiles.old 2> /dev/null
	if [ -f "${HOME}/${BASH_ALIASES}" ]; then mv -f ${HOME}/${BASH_ALIASES} ${HOME}/.dotfiles.old 2> /dev/null; fi
	if [ -f "${HOME}/${BASHRC}" ]; then mv -f ${HOME}/${BASHRC} ${HOME}/.dotfiles.old 2> /dev/null; fi
	if [ -f "${HOME}/${BASH_PROFILE}" ]; then mv -f ${HOME}/${BASH_PROFILE} ${HOME}/.dotfiles.old 2> /dev/null; fi
	if [ -f "${HOME}/${BASH_COLORS}" ]; then mv -f ${HOME}/${BASH_COLORS} ${HOME}/.dotfiles.old 2> /dev/null; fi
	if [ -f "${HOME}/${GEMRC}" ]; then mv -f ${HOME}/${GEMRC} ${HOME}/.dotfiles.old 2> /dev/null; fi
	if [ -f "${HOME}/${GITCONFIG}" ]; then mv -f ${HOME}/${GITCONFIG} ${HOME}/.dotfiles.old 2> /dev/null; fi
	if [ -f "${HOME}/${GITIGNORE}" ]; then mv -f ${HOME}/${GITIGNORE} ${HOME}/.dotfiles.old 2> /dev/null; fi
	if [ -f "${HOME}/${RDEBUGRC}" ]; then mv -f ${HOME}/${RDEBUGRC} ${HOME}/.dotfiles.old 2> /dev/null; fi
	if [ -f "${HOME}/${VIMRC}" ]; then mv -f ${HOME}/${VIMRC} ${HOME}/.dotfiles.old 2> /dev/null; fi
	if [ -f "${HOME}/${BUNDLE}" ]; then mv -f ${HOME}/${BUNDLE} ${HOME}/.dotfiles.old 2> /dev/null; fi
	if [ -f "${HOME}/${RSPEC}" ]; then mv -f ${HOME}/${RSPEC} ${HOME}/.dotfiles.old 2> /dev/null; fi

symlinks:
	ln -s ${PWD}/${BASH_ALIASES} ${HOME}/${BASH_ALIASES}
	ln -s ${PWD}/${BASHRC} ${HOME}/${BASHRC}
	ln -s ${PWD}/${BASH_PROFILE} ${HOME}/${BASH_PROFILE}
	ln -s ${PWD}/${BASH_COLORS} ${HOME}/${BASH_COLORS}
	ln -s ${PWD}/${GEMRC} ${HOME}/${GEMRC}
	ln -s ${PWD}/${GITCONFIG} ${HOME}/${GITCONFIG}
	ln -s ${PWD}/${GITIGNORE} ${HOME}/${GITIGNORE}
	ln -s ${PWD}/${RDEBUGRC} ${HOME}/${RDEBUGRC}
	ln -s ${PWD}/${VIMRC} ${HOME}/${VIMRC}
	ln -s ${PWD}/${BUNDLE} ${HOME}/${BUNDLE}
	ln -s ${PWD}/${RSPEC} ${HOME}/${RSPEC}

install: backupfiles symlinks
