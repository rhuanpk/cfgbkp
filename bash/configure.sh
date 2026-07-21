#!/usr/bin/bash

if ! grep -qF '. "$HOME/.bash_vars"' ~/.profile; then
	tee -a ~/.profile <<- \eof

		[ -r "$HOME/.bash_vars" ] && . "$HOME/.bash_vars"
	eof
fi

if ! grep -qF '. "$PATH_CFGBKP/bash/.bashrc"' ~/.bashrc; then
	tee -a ~/.bashrc <<- \eof

		[ -r "$PATH_CFGBKP/bash/.bashrc" ] && . "$PATH_CFGBKP/bash/.bashrc"
	eof
fi
