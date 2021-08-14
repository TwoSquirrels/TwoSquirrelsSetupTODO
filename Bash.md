# Bash

## bash_aliases for all users

```shell
cat <<EOF >> /etc/bash.bashrc

# bash_aliases for all users
[ -r /etc/bash.bash_aliases ] && . /etc/bash.bash_aliases
EOF
cat <<EOF >> /etc/bash.bash_aliases
#!/bin/bash
EOF
```

### prompt decoration

```shell
cat <<EOF >> /etc/bash.bash_aliases

# prompt

# root -> # , other -> $
function prompt_sign() {
    if [ `id -u` -eq 0 ]; then
	echo "#"
    else
        echo "$"
    fi
}

# last exit code
function prompt_return() {
    RETVAL=$?
    [ $RETVAL -ne 0 ] && echo "[$RETVAL] "
}

# get current branch in git repo
function prompt_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]; then
        STAT=`prompt_git_dirty`
        echo " (${BRANCH}${STAT})"
    else
        echo ""
    fi
}

# get current status of git repo
function prompt_git_dirty {
    status=`git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    bits=''
    [ "${renamed}" == "0" ] && bits=">${bits}"
    [ "${ahead}" == "0" ] && bits="*${bits}"
    [ "${newfile}" == "0" ] && bits="+${bits}"
    [ "${untracked}" == "0" ] && bits="?${bits}"
    [ "${deleted}" == "0" ] && bits="x${bits}"
    [ "${dirty}" == "0" ] && bits="!${bits}"
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}

export PS1="\[\e[1;31m\]\`prompt_return\`\[\e[m\]\[\e[1;32m\]\u\[\e[m\]@\[\e[0;32m\]\h\[\e[m\]:\[\e[1;36m\]\w\[\e[m\]\`prompt_git_branch\` \`prompt_sign\` "
EOF
```

## useful bash_aliases

```shell
cat <<EOF >> ~/.bash_aliases
#!/bin/bash

# ls
alias la="ls -A"
alias ll="ls -Alh"
alias l="ls"

# mkdir
alias mkdir="mkdir -p"

# cd --force (mkdir then cd)
function cdf() {
    mkdir $1
    cd $_
}

# git
alias g="git"
alias gs="git status"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit"
alias gca="git commit --amend"
alias gp="git push"
alias gf="git fetch --all"
alias gp="git pull"
alias gg="git graph"
alias gb="git branch"
alias gco="git checkout"
alias gd="git diff"
alias gdw="git diff --word-diff"
EOF
```

## user commands

```shell
cat <<EOF >> ~/.profile

# user commands
export PATH="$HOME/bin:$PATH"
EOF
```
