# add OSX ports system to path if present
for x in /opt/local/bin /opt/local/sbin ; do
	if [[ -d $x ]] ; then
		export PATH="$x:$PATH"
	fi
done