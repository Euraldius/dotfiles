alias tns="tmux new-session -s"
alias tat="tmux attach-session -t"
alias b="bundle"
alias be="bundle exec"
alias prpm="pipenv run python manage.py"
alias woman="man"
alias fucking="sudo"

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
bindkey -s '^L' 'clear; echo "Trans women are beautiful <3"\n'

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

eval "$(rbenv init -)"

export WORKON_HOME=$HOME/code/.virtualenvs
export PROJECT_HOME=$HOME/code
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
source /usr/local/bin/virtualenvwrapper.sh

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"
. `brew --prefix`/etc/profile.d/z.sh
