#!/bin/bash
sudo apt-get install most
set -e
set -x
curl https://github.com/johmathe.keys >> ~/.ssh/authorized_keys
git pull && git submodule init && git submodule update && git submodule status

for d in `ls -d */`; do
    pushd $d
    test -f ./install.sh && ./install.sh;
    popd;
done;

set +e
set +x

mkdir ~/bin
curl https://www.iterm2.com/utilities/imgcat > ~/bin/imgcat && chmod 755 ~/bin/imgcat
