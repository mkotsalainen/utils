#from robbyrussel
#PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} %{$reset_color%}'
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo 'env:('%{$fg_bold[red]%}`basename $VIRTUAL_ENV`%{$fg_bold[blue]%}') '
}

PROMPT='%{$fg_bold[blue]%}%m %{$fg_bold[green]%}%~ %{$fg_bold[blue]%}$(virtualenv_info)$(git_prompt_info)%{$fg_bold[blue]%}
%{$fg_bold[red]%}➜ %{$reset_color%}'
RPROMPT='[%*]'


ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
