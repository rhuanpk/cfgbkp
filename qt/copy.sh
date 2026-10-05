#!/usr/bin/bash

url_setpath='https://raw.githubusercontent.com/rhuanpk/linux/main/scripts/.private/setpath.sh'
[ -z "$PATH_CFGBKP" ] && source /etc/environment
[ -z "$PATH_CFGBKP" ] && PATH_CFGBKP="$(find "$HOME/" -type f -name '.cfgbkp.pf' 2>&- \ | xargs dirname 2>&- \ | tail -1)"
path_cfgbkp="${PATH_CFGBKP:-$(curl -fsL "$url_setpath" | bash -s -- -p cfgbkp)}"
: ${path_cfgbkp:?path cfgbkp must be set}

path_config_qt5_src="$path_cfgbkp/qt/qt5ct.conf"
path_config_qt6_src="$path_cfgbkp/qt/qt6ct.conf"

path_config_qt5_dst="$HOME/.config/qt5ct"
path_config_qt6_dst="$HOME/.config/qt6ct"

mkdir -pv "$path_config_qt5_dst/" "$path_config_qt6_dst/"
cp -fv "$path_config_qt5_src" "$path_config_qt5_dst/"
cp -fv "$path_config_qt6_src" "$path_config_qt6_dst/"
