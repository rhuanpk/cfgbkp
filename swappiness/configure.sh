#!/usr/bin/bash

sudo='sudo'

while getopts 'r' option; do
        [ "$option" = 'r' ] && unset sudo
done
shift $((OPTIND-1))

[ "$sudo" ] && sudo -v

read -p "$0: vfs_cache_pressure: " pressure

$sudo mkdir -pv /etc/sysctl.d/
$sudo tee /etc/sysctl.d/99-sysctl.conf <<- eof
	vm.swappiness=10
	vm.vfs_cache_pressure=$pressure
eof
