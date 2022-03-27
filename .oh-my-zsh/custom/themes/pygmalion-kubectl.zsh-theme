# Yay! High voltage and arrows!

prompt_setup_pygmalion(){
  ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚡%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_CLEAN=""
  ZSH_THEME_KCTL_CONTEXT_PROMPT_PREFIX="%{$fg[yellow]%}k8s_context:%{$reset_color%}%{$fg[blue]%}"
  ZSH_THEME_KCTL_CONTEXT_PROMPT_SUFFIX="%{$fg[red]%}|%{$reset_color%}"
  ZSH_THEME_KCTL_NAMESPACE_PROMPT_PREFIX="%{$fg[yellow]%}k8s_namespace:%{$reset_color%}%{$fg[blue]%}"
  ZSH_THEME_KCTL_NAMESPACE_PROMPT_SUFFIX="%{$reset_color%}"


  base_prompt='%{$fg[magenta]%}%n%{$reset_color%}%{$fg[cyan]%}@%{$reset_color%}%{$fg[yellow]%}%m%{$reset_color%}%{$fg[red]%}:%{$reset_color%}%{$fg[cyan]%}%0~%{$reset_color%}%{$fg[red]%}|%{$reset_color%}'
  post_prompt='%{$fg[cyan]%}⇒%{$reset_color%}  '

  base_prompt_nocolor=$(echo "$base_prompt" | perl -pe "s/%\{[^}]+\}//g")
  post_prompt_nocolor=$(echo "$post_prompt" | perl -pe "s/%\{[^}]+\}//g")

  precmd_functions+=(prompt_pygmalion_precmd)
}

prompt_pygmalion_precmd(){
  local gitinfo=$(git_prompt_info)
  local kctl_context=$(kctl_context_info)
  local kctl_namespace=$(kctl_namespace_info)
  local gitinfo_nocolor=$(echo "$gitinfo" | perl -pe "s/%\{[^}]+\}//g")
  local exp_nocolor="$(print -P \"$base_prompt_nocolor$gitinfo_nocolor$post_prompt_nocolor\")"
  local prompt_length=${#exp_nocolor}

  local nl=""

  if [[ $prompt_length -gt 40 ]]; then
    nl=$'\n%{\r%}';
  fi
  RPROMPT="$ZSH_THEME_KCTL_CONTEXT_PROMPT_PREFIX$kctl_context$ZSH_THEME_KCTL_CONTEXT_PROMPT_SUFFIX$ZSH_THEME_KCTL_NAMESPACE_PROMPT_PREFIX$kctl_namespace$ZSH_THEME_KCTL_NAMESPACE_PROMPT_SUFFIX"
  PROMPT="$base_prompt$gitinfo$nl$post_prompt"
}

prompt_setup_pygmalion
