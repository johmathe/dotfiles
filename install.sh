#!/bin/bash
sudo apt-get install most
set -e
set -x

git pull && git submodule init && git submodule update && git submodule status

for d in `ls -d */`; do
    pushd $d
    test -f ./install.sh && ./install.sh;
    popd;
done;

set +e
set +x
