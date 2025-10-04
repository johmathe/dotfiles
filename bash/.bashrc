# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=3000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Get git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

# Get return code
get_return_code() {
    local EXIT="$?"
    if [ $EXIT != 0 ]; then
        echo -e "\033[0;31m❌ $EXIT\033[0m"
    else
        echo -e "\033[0;32m✓\033[0m"
    fi
}

# Get conda env
get_conda_env() {
    if [ ! -z "$CONDA_DEFAULT_ENV" ]; then
        echo -e "🐍 \033[0;36m$CONDA_DEFAULT_ENV\033[0m"
    fi
}

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/johmathe/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/johmathe/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/johmathe/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/johmathe/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Fast git branch (minimal checks)
parse_git_branch_fast() {
    local branch=$(git branch --show-current 2>/dev/null)
    if [ -n "$branch" ]; then
        echo -e " \033[38;5;214m🌿\033[38;5;204m$branch\033[0m"
    fi
}

# Fast conda env
get_conda_env_fast() {
    if [ ! -z "$CONDA_DEFAULT_ENV" ]; then
        echo -e "\033[38;5;214m🐍\033[38;5;180m$CONDA_DEFAULT_ENV\033[0m "
    fi
}

# Fast return code
get_return_code_fast() {
    local EXIT="$?"
    if [ $EXIT != 0 ]; then
        echo -e "\033[38;5;196m💥 $EXIT\033[0m "
    else
        echo -e "\033[38;5;46m✨\033[0m "
    fi
}

# Super fast PS1 with emojis
PS1='\n$(get_return_code_fast)$(get_conda_env_fast)\[\033[38;5;109m\]👤\u\[\033[0m\] \[\033[38;5;67m\]💻\h\[\033[0m\] \[\033[38;5;108m\]📁\w\[\033[0m\]$(parse_git_branch_fast) \[\033[38;5;103m\]🕐\t\[\033[0m\]\n\[\033[38;5;110m\]❯\[\033[0m\] '

. "$HOME/.local/bin/env"

export PATH=$PATH:/home/johmathe/.local/bin