alias tns="tmux new-session -s"
alias tat="tmux attach-session -t"
alias b="bundle"
alias be="bundle exec"
alias g="git"
alias localip="ipconfig getifaddr en0"

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

eval "$(rbenv init -)"

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"
. `brew --prefix`/etc/profile.d/z.sh

# env vars for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# paths for gitlab GDK
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_PATH"

# env var for GPG
export GPG_TTY=$(tty)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/awolfe/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/awolfe/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/awolfe/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/awolfe/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# add gcloud utils to shell for kubectl
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'

# icu4c paths for GDK
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
