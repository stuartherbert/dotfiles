# do we *have* keychain in the first place?
if `which keychain` ; then
	keychain ~/.ssh/id_dsa
	for x in ~/.keychain/$HOSTNAME-* ; do
		. $x
	done
fi
