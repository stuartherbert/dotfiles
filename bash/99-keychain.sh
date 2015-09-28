# do we *have* keychain in the first place?
if `which keychain 2> /dev/null` ; then
	keys=
	for x in id_dsa id_rsa id_ganbaro ; do
		key=~/.ssh/$x
		if [[ -f $key ]] ; then
			keys="${keys} $key"
		fi
	done
	keychain $keys
	for x in ~/.keychain/$HOSTNAME-sh ; do
		. $x
	done
fi
