local ret_status="%(?:%{$fg_bold[green]%}❯:%{$fg_bold[red]%}❯%s)"

function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%{$fg_bold[red]%}(ssh) "
  fi
}

function nvm_status() {
  [[ -f package.json || -d node_modules ]] || return

  $(type nvm >/dev/null 2>&1) || return

  local nvm_status=$(nvm current 2>/dev/null)
  [[ "${nvm_status}" == "system" ]] && return
  nvm_status=${nvm_status}

  echo -n "%{$fg_bold[green]%}"
  echo -n "⬢ ${nvm_status}"
  echo -n "%{$reset_color%}"
}


git_is_rebasing() {
  git_dir=$(git rev-parse --git-dir)
  test -d "$git_dir/rebase-merge" -o -d "$git_dir/rebase-apply"
}

prompt_git_rebase_check() {
  if $(git_is_rebasing); then
    echo "\uf454 "
  else
    echo "\uf418 "
  fi
}

function echo_git_prompt() {
  echo "%{$fg[white]%}$(parse_git_dirty)$(prompt_git_rebase_check)$(git_current_branch)$(git_prompt_status)$ZSH_THEME_GIT_PROMPT_SUFFIX%{$fg[white]%} in$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    base=$(basename $git_root)
    parent=${git_root%\/*}
    prompt_short_dir="$(echo_git_prompt) %{$fg[blue]%}\uf401 $base%{$reset_color%}${PWD#$git_root}"
  fi
  echo $prompt_short_dir
}

PROMPT='${ssh_connection}%{$fg[white]%}$(get_pwd) %{$reset_color%}%{$reset_color%}$ret_status%{$reset_color%} '
RPROMPT='$(nvm_status)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$reset_color%}%{$fg[yellow]%}??"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$reset_color%}%{$fg[cyan]%}M"
ZSH_THEME_GIT_PROMPT_ADDED="%{$reset_color%}%{$fg[green]%}A"
