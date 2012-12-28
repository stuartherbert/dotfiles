# add OSX ports system to path if present
for x in /opt/local/bin /opt/local/sbin ; do
	if [[ -d $x ]] ; then
		export PATH="$x:$PATH"
	fi
done

# add the Macports Python folder to the path that Python looks in
if [[ -d /opt/local/Library/Frameworks/Python.framework ]] ; then
	export PYTHONPATH="/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages:$PYTHONPATH"
fi