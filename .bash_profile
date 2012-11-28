# .bash_profile
#	Setup an interactive bash shell
#
#	Stuart Herbert
#	(stuart@stuartherbert.com)
#
#	http://github.com/stuartherbert/dotfiles

# Add '~/bin' to the PATH
export PATH="$HOME/bin:$PATH"

# Load in the changes that we want
#
# We load from the following places
#
# 1. ~/.dotfiles-private/bash/*.sh - anything you don't share publically
# 2. ~/.dotfiles/bash/*.sh         - Stu's dotfiles repo
# 3. ~/.dotfiles-extra/bash/*.sh   - Anything extra you want to add

for file in ~/{.dotfiles-private,.dotfiles,.dotfiles-extra}/bash/*.sh ; do
	[[ -r $file ]] && source "$file"
done
unset file
