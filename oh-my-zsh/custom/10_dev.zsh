# ========= Github specific settings ========= 
alias ggff='git merge --ff-only origin/$(git_current_branch)'
alias ggfe='git fetch origin'

alias giff='git merge --ff-only imotov/$(git_current_branch)'
alias gife='git fetch imotov'
alias gipush='git push imotov "$(git_current_branch)"'

function gfe {
	git fetch $1
}
function gff {
	git merge --ff-only $1/$(git_current_branch)
}

# fetch PR from remote 
function gprf {
  git fetch origin pull/$1/head:pr/$1
}

# fetch PR and squash merge it into master
function gprm {
  gprf $1 && git merge --squash pr/$1
}

# clean after PR review
function gprc {
  git branch -D pr/$1 && git reset --hard HEAD
}

function gnow {
  GIT_COMMITTER_DATE=`date '+%Y-%m-%d %H:%M:%S %z'`
  git commit --amend  --no-edit --date "$GIT_COMMITTER_DATE"
}

function gda {
  git_date=$([[ $OS == "Darwin" ]] && date -v-$1d '+%Y-%m-%d %H:%M:%S %z' || date --date="$1 day ago" '+%Y-%m-%d %H:%M:%S %z')
  GIT_COMMITTER_DATE="$git_date" git commit --amend  --no-edit --date "$git_date"
}

# ========= Misc commands ========= 

function shuffle {
  for i; do
    echo $i
  done \
  | awk 'BEGIN{srand()}{print rand(), $0}' \
  | sort -n -k 1 \
  | awk 'sub(/^[0-9.]+ ([a-zA-Z0-9]+)$/,$2)' \
  | tr '\n' ' '
	echo
}

# Working directories
alias cds='cd ~/Software'
alias cdd='cd ~/Downloads'
alias cddf='cd ~/.dotfiles'
alias cdsb='cd ~/Sandbox'
alias cdp='cd ~/Projects'
alias cdpi='cd ~/Projects/imotov'
alias cdpa='cd ~/Projects/akaula'
