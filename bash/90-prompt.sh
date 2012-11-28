# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color*) color_prompt=yes;;
esac

# function for git info to add to prompt
function _git_prompt() {
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            local ansi=42
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            local ansi=43
        else
            local ansi=45
        fi
        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
            branch=${BASH_REMATCH[1]}
        else
            # Detached HEAD.  (branch=HEAD is a faster alternative.)
            branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
                echo HEAD`)"
        fi
        echo -n '\[\e[0;37;'"$ansi"';1m\]'"$branch"'\[\e[0m\] '
    fi
}

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
else
    color_prompt=yes
fi

function _prompt_command() {
    if [ "$color_prompt" = yes ]; then
        PS1='${shell_chroot:+($shell_chroot)}'"`_git_prompt`"'\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    else
        PS1='${shell_chroot:+($shell_chroot)}'"`_git_prompt`"'\u@\h:\w\$ '
    fi
}

if [[ -z $PROMPT_COMMAND ]]; then
	# setup the PROMPT_COMMAND for the first time
	PROMPT_COMMAND=_prompt_command
else
	# we already have a PROMPT_COMMAND; append to it
	PROMPT_COMMAND="$PROMPT_COMMAND;_prompt_command"
fi
