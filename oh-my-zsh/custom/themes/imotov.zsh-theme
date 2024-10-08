local user='%{$fg_bold[blue]%}%n@%m%{$reset_color%}'
local connection=''
local pwd='%{$fg[green]%}%~%{$reset_color%}'
local git_branch='$(git_prompt_info)'
local virtualenv_prompt_info='$(virtualenv_prompt_info)'

if [[ -v SSH_CONNECTION ]]; then
    connection="%{$fg[red]%}⚡%{$reset_color%}"
 else
    connection=""
fi

PROMPT="${connection}${user}:${pwd}${virtualenv_prompt_info}${git_branch}❯ "

ZSH_THEME_GIT_PROMPT_PREFIX="❮%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}⭒%{$reset_color%}"

ZSH_THEME_VIRTUALENV_PREFIX="[%{$fg[magenta]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%}]"

# elaborate exitcode on the right when >0
return_code_enabled="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
return_code_disabled=
return_code=$return_code_enabled

RPS1='${return_code}'

function accept-line-or-clear-warning () {
	if [[ -z $BUFFER ]]; then
		time=$time_disabled
		return_code=$return_code_disabled
	else
		time=$time_enabled
		return_code=$return_code_enabled
	fi
	zle accept-line
}
zle -N accept-line-or-clear-warning
bindkey '^M' accept-line-or-clear-warning
