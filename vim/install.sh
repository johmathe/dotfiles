#!/bin/bash -x

sudo pip install yapf flake8 rope

backup_dir=backup_$(date +"%Y-%m-%d_%Hh%Mm%Ss")
echo $backup_dir

git submodule update
for f in .vim{rc,}; do
    echo $f;
    if [[ -e ~/$f ]]; then
        mkdir -p $backup_dir;
        mv ~/$f $backup_dir;
    fi;
    ln -sf $(pwd)/$f ~/$f;
done;

./build_command-t.sh
