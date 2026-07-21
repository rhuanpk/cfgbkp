#!/usr/bin/bash

url_setpath='https://raw.githubusercontent.com/rhuanpk/linux/main/scripts/.private/setpath.sh'
[ -z "$PATH_CFGBKP" ] && source /etc/environment
[ -z "$PATH_CFGBKP" ] && PATH_CFGBKP="$(find "$HOME/" -type f -name '.cfgbkp.pf' 2>&- \ | xargs dirname 2>&- \ | tail -1)"
path_cfgbkp="${PATH_CFGBKP:-$(curl -fsL "$url_setpath" | bash -s -- -p cfgbkp)}"
: ${path_cfgbkp:?path cfgbkp must be set}

path_sway_src="$path_cfgbkp/wayland/sway/config"
path_sway_dst="$HOME/.config/sway"

mkdir -pv "$path_sway_dst/"
ln -sfv "$path_sway_src" "$path_sway_dst/"
