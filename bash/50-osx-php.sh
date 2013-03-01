# add OSX install of PHP5 to path if present
for x in /usr/local/php5/bin ; do
	if [[ -d $x ]] ; then
		export PATH="$x:$PATH"
	fi
done