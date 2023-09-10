#!/bin/bash
#
#
OLDIFS=$IFS
CONFIG_PATH="$HOME/.config"
FILES=(
	"starship.toml" 
	"picom.conf" 
	"doom" 
	"kitty" 
	"lf" 
	"i3"
	"i3status" 
	"nvim"
)
DOT_FILES=(
	"zshrc"
)

config_directories=()
for file in ${FILES[@]};do
	config_directories+=" $CONFIG_PATH/$file,$(pwd)/$file"
done
for file in ${DOT_FILES[@]};do
	config_directories+=" $HOME/.$file,$(pwd)/$file"
done

function backup_fd {
	rm -rf "$1.old"
	mv $1 "$1.old"
}
#echo $config_directories
for d in ${config_directories[@]}
do
	IFS=","
	set -- $d
	# Check if file or directory exists and create backup if exists
	[ -e $1 ] && echo -e "\e[0;32mBacking up $1" && backup_fd $1
	ln -s $2 $1
	echo -e "\e[0;32mSymlink created:\n \e[0;0m$1 ---------> $2"
done
IFS=$OLDIFS
