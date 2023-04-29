preexec() {
  timer=$(($(date +%s%N)/1000000))
}
converttime() {
  sec=(${1}/1000)
  if [ "${1}" -ge 3600000 ]; then
    echo "$(($sec/3600))h $((($sec/60)%60))m $(($sec%60))s"
  elif [ "${1}" -ge 60000 ]; then
    echo "$((($sec/60)%60))m $(($sec%60))s"
  elif [ "${1}" -ge 1000 ]; then
    echo "$(($sec%60))s $((${1}%1000))ms"
  else
    echo "${1}ms"
  fi
}
precmd() {
  if [ $timer ]; then
    now=$(($(date +%s%0N)/1000000))
    elapsed=$(converttime $(($now-timer)))
    export EXECTIME="${ZSH_THEME_EXECTIME_PROMPT_PREFIX}${elapsed}${ZSH_THEME_EXECTIME_PROMPT_SUFFIX}"
    unset timer
  fi
}
() {
  local PR_USER PR_PROMPT PR_HOST
  if [[ $UID -ne 0 ]]
  then
    PR_USER='%F{cyan} %n%f'
    PR_PROMPT='%(?:%{$fg_bold[green]%} $:%{$fg_bold[red]%} $)%f'
  else
    PR_USER='%F{red} %n%f'
    PR_PROMPT='%(?:%{$fg_bold[green]%} #:%{$fg_bold[red]%} #)%f'
  fi
  if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
    PR_HOST='%F{yellow}歷%M%f'
  else
    PR_HOST='%F{green} %M%f'
  fi
  PROMPT="%B┬[${PR_USER}]─[${PR_HOST}]─[%F{blue} %(3~|.../%2~|%~)%f]\$(virtualenv_prompt_info)\$(ruby_prompt_info)\$(git_prompt_info)%b
%B└%(?::[%{$fg_bold[magenta]%} %?%f]─)[$PR_PROMPT] %b"
RPROMPT="%B\$(git_prompt_status)\${EXECTIME}%b"
  ZSH_THEME_RUBY_PROMPT_PREFIX="─[%F{red} "
  ZSH_THEME_RUBY_PROMPT_SUFFIX="%f]"
  ZSH_THEME_VIRTUALENV_PREFIX="─[%F{magenta} "
  ZSH_THEME_VIRTUALENV_SUFFIX="%f]"
  ZSH_THEME_EXECTIME_PROMPT_PREFIX="[%F{yellow}祥"
  ZSH_THEME_EXECTIME_PROMPT_SUFFIX="%f]─"
  ZSH_THEME_GIT_PROMPT_PREFIX="─[%F{yellow} "
  ZSH_THEME_GIT_PROMPT_SUFFIX=""
  ZSH_THEME_GIT_PROMPT_DIRTY="%f]"
  ZSH_THEME_GIT_PROMPT_CLEAN="%f]"
  ZSH_THEME_GIT_PROMPT_ADDED="[%F{green}%f]─"
  ZSH_THEME_GIT_PROMPT_MODIFIED="[%F{yellow}%f]─"
  ZSH_THEME_GIT_PROMPT_DELETED="[%F{red}﯊%f]─"
  ZSH_THEME_GIT_PROMPT_RENAMED="[%F{magenta}%f]─"
  ZSH_THEME_GIT_PROMPT_UNMERGED="[%F{cyan}%f]─"
  ZSH_THEME_GIT_PROMPT_UNTRACKED="[%F{blue}%f]─"
}
