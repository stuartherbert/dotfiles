# 00-scripts
# add any utilities distributed via the dotfiles to the PATH
if [[ -d $HOME/.dotfiles/bin ]] ; then
	export PATH=$HOME/.dotfiles/bin:$PATH
fi