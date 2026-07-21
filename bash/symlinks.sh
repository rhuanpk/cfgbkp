#!/usr/bin/bash

url_setpath='https://raw.githubusercontent.com/rhuanpk/linux/main/scripts/.private/setpath.sh'
[ -z "$PATH_CFGBKP" ] && source /etc/environment
path_cfgbkp="${PATH_CFGBKP:-$(curl -fsL "$url_setpath" | bash -s -- -p cfgbkp)}"
: ${path_cfgbkp:?path cfgbkp must be set}

path_bash_aliases="$path_cfgbkp/bash/.bash_aliases"
path_bash_functions="$path_cfgbkp/bash/.bash_functions"

ln -sfv "$path_bash_aliases" "$HOME/${path_bash_aliases##*/}"
ln -sfv "$path_bash_functions" "$HOME/${path_bash_functions##*/}"
