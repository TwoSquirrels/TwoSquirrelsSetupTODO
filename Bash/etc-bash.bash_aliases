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
