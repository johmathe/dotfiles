# -- systemwide .profile
function parse_git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "("${ref#refs/heads/}")"
}

if [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
fi
if [[ -f ${HOME}/.bash_completion && -d ${HOME}/.bash_completion.d ]]; then
    . ${HOME}/.bash_completion
fi

platform=$(uname)

# Some colors on linux
if [[ $platform == 'Linux' ]]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias ll='ls -l --color=auto'
fi

if [[ -e /usr/bin/most ]]; then
    export PAGER='/usr/bin/most'
fi
export CLICOLOR=1
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/caffe/lib/
export EDITOR=/usr/bin/vim
export LD_LIBRARY_PATH=/usr/local/cuda/lib64/
export PATH=$PATH:/usr/local/arcanist/arcanist/bin
export PATH=$PATH:/usr/local/cuda/bin:/Users/johmathe/code/depot_tools
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w $(parse_git_branch)\$\[\033[00m\] '
export VISUAL=${EDITOR}

export PATH=$PATH:/home/johmathe/.local/bin

# The next line updates PATH for the Google Cloud SDK.
CLOUD_FILE='/home/$USER/google-cloud-sdk/path.bash.inc'
COMPLETION_FILE='/home/$USER/google-cloud-sdk/completion.bash.inc'
if [[ -e $CLOUD_FILE ]]; then
    source $CLOUD_FILE
    source $COMPLETION_FILE
fi

. $HOME/.ssh/saveagent
alias tma='tmux attach ; . $HOME/.ssh/latestagent'
