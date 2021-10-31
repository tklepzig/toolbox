#!/usr/bin/env zsh

if [ -z $1 ]
then
	echo "Usage: syncWithDrive.sh /path/to/drive"
	exit 1
fi

toolboxDir=$HOME/.toolbox
rsync -avz --stats --delete --filter="dir-merge,- .gitignore" --exclude  ".git" "$toolboxDir/" "$1/toolbox"
