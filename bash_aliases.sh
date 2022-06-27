# disable pc speaker beep
xset b off

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#default PS1:
#           \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$
export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[0;31m\]\$(parse_git_branch)\[\033[00m\]\$ "

alias git_remove_merged_branches='git branch --merged | egrep -v "(^\*|master|release|dev)" | xargs git branch -d'
alias git_remove_deleted_branches='git remote prune origin'

alias git_pull='git checkout master && git pull'
alias git_push='git push --no-verify'
alias git_fetch='git fetch --all'
alias git_log='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

alias deno_fmt='deno fmt --options-use-tabs --options-single-quote --options-line-width 120 --ignore=node_modules'

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
