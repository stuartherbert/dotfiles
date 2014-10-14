# many golang tools refuse to work without GOPATH set
#
# in 90-prompt.sh, we will set GOPATH to be $GOPATH_PREFIX:`pwd`
export GOPATH_PREFIX=$HOME/Devel/go