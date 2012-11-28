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
export PROMPT_COMMAND="history -a; history -n"
