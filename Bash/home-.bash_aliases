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

