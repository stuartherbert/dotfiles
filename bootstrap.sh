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

# let's copy everything over ... as long as it starts with a .
for x in ~/{.dotfiles-private,.dotfiles,.dotfiles-extra}/.* ; do
	# skip anything that doesn't exist
	if [[ -e $x ]] ; then
		# skip things that we don't want copied
		case "`basename $x`" in
			'.' | '..' |'.git')
				;;
			*)
				if [[ -d $x ]] ; then
					echo "Installing dotfolder $x"
				else
					echo "Installing dotfile   $x"
				fi
				cp -ldR --preserve=all $x ~
				;;
		esac
	fi
done 