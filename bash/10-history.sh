# make sure the history is enabled
set -o history

# don't put duplicate lines, or lines starting with space, into the history
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# set a limit on how large the file can grow
HISTSIZE=10000
unset HISTFILESIZE

# make bash sync the history file after every command
if [[ -z $PROMPT_COMMAND ]] ; then
	PROMPT_COMMAND="history -a"
else
	PROMPT_COMMAND="$PROMPT_COMMAND ; history -a"
fi
