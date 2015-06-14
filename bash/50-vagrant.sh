# add vagrant to my PATH
if [[ -d /opt/vagrant/bin ]] ; then
	export PATH=/opt/vagrant/bin:$PATH
fi

# add vagrant key
if [[ -d $HOME/.vagrant.d/insecure_private_key ]] ; then
	ssh-add $HOME/.vagrant.d/insecure_private_key
fi