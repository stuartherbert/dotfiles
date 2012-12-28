#!/bin/bash
#
# bootstrap.sh:
#	Install dotfiles in the expected places
#
# Author:
#	Stuart Herbert
#	(stuart@stuartherbert.com)
#
# Copyright:
#	(c) 2012-present Stuart Herbert
#	Released under the new BSD licence
#
# Homepage:
#	https://github.com/stuartherbert/dotfiles

# $1 - file to copy
# $2 - destination file
function copy_file() {
	# what are we doing?
	echo "Installing dotfile   $2"

	# anything we need to remove first?
	if [[ -e $2 ]] ; then
		rm -f $2
	fi

	# make a hard link
	ln "$1" "$2"
}

# $1 - folder to copy
# $2 - destination folder
function copy_files() {
	# skip anything we do not want to copy
	case "`basename $1`" in
		'.'|'..'|'.git')
			return ;;
	esac

	# what are we doing?
	echo "Installing dotfolder $2"

	# make sure the destination folder exists
	if [[ ! -d $2 ]] ; then
		echo "Creating folder $2"
		mkdir -p "$2"
	fi

	# what is inside the source folder?
	cd "$1"
	for x in * .* ; do
		# skip things that we don't want copied
		case "$x" in
			'.'|'..'|'.git')
				;;
			*)
				if [[ -d $1/$x ]] ; then
					copy_files "$1/$x" "$2/$x"
				elif [[ -e $1/$x ]] ; then
					copy_file  "$1/$x" "$2/$x"
				fi
		esac
	done
}

# make sure any git submodules exist
# this avoids problems with things like Vim
git submodule init
git submodule update

# let's copy everything over ... as long as it starts with a .
for x in ~/{.dotfiles-private,.dotfiles,.dotfiles-extra}/.* ; do
	# skip anything that doesn't exist
	if [[ -e $x ]] ; then
		if [[ -d $x ]] ; then
			copy_files "$x" $HOME/`basename $x`
		else
			copy_file "$x" $HOME/`basename $x`
		fi
	fi
done 
