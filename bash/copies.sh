#!/usr/bin/bash

url_setpath='https://raw.githubusercontent.com/rhuanpk/linux/main/scripts/.private/setpath.sh'
[ -z "$PATH_CFGBKP" ] && source /etc/environment
path_cfgbkp="${PATH_CFGBKP:-$(curl -fsL "$url_setpath" | bash -s -- -p cfgbkp)}"
: ${path_cfgbkp:?path cfgbkp must be set}

path_bash_local="$path_cfgbkp/bash/.bash_local"
path_bash_vars="$path_cfgbkp/bash/.bash_vars"

cp -fv "$path_bash_local" "$HOME/${path_bash_local##*/}"
cp -fv "$path_bash_vars" "$HOME/${path_bash_vars##*/}"
