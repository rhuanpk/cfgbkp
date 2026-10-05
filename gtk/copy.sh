#!/usr/bin/bash

url_setpath='https://raw.githubusercontent.com/rhuanpk/linux/main/scripts/.private/setpath.sh'
[ -z "$PATH_CFGBKP" ] && source /etc/environment
[ -z "$PATH_CFGBKP" ] && PATH_CFGBKP="$(find "$HOME/" -type f -name '.cfgbkp.pf' 2>&- \ | xargs dirname 2>&- \ | tail -1)"
path_cfgbkp="${PATH_CFGBKP:-$(curl -fsL "$url_setpath" | bash -s -- -p cfgbkp)}"
: ${path_cfgbkp:?path cfgbkp must be set}

config_name='settings.ini'

path_config_gtk3_src="$path_cfgbkp/gtk/gtk-3.0_settings.ini"
path_config_gtk4_src="$path_cfgbkp/gtk/gtk-4.0_settings.ini"

path_config_gtk3_dst="$HOME/.config/gtk-3.0"
path_config_gtk4_dst="$HOME/.config/gtk-4.0"

mkdir -pv "$path_config_gtk3_dst/" "$path_config_gtk4_dst/"
cp -fv "$path_config_gtk3_src" "$path_config_gtk3_dst/$config_name"
cp -fv "$path_config_gtk4_src" "$path_config_gtk4_dst/$config_name"
