alias tns="tmux new-session -s"
alias tat="tmux attach-session -t"
alias b="bundle"
alias be="bundle exec"

autoload -U colors
colors
export CLICOLOR=1

autoload -U compinit
compinit

setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
bindkey -s '^L' 'clear; echo "Trans women are badass <3"\n'

setopt extendedglob
unsetopt nomatch

export VISUAL=vim
export EDITOR=$VISUAL

git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo " %{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}"
  fi
}
setopt promptsubst
export PS1='${SSH_CONNNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '

g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}
compdef g=git

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"

# setup rbenv
eval "$(rbenv init -)"

# require virtualenv for installing python packages
export PIP_REQUIRE_VIRTUALENV=true

# set AWS creds
. ~/dev/bermuda/env/bin/activate
eval $(awsenv --profile=${AWS_DEFAULT_PROFILE:-"default"})
deactivate

# use 2U's Vault http://vaultproject.io/
export VAULT_ADDR=https://vault.prod.2u.com:8200/
export VAULT_CACERT=$HOME/.certs/vault-ca.pem
