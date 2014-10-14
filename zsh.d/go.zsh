export GOPATH=$HOME/Code/go
PATH=`echo $PATH|
  addpath $GOPATH/bin |
  addpath /usr/local/opt/go/libexec/bin`
export PATH
