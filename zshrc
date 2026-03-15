# zmodload zsh/zprof

ZSH_DISABLE_COMPFIX=true
export ZSH="$HOME/.oh-my-zsh"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Start ssh-agent
zstyle :omz:plugins:ssh-agent agent-forwarding on

plugins=(
  git
  alias-finder
  brew
  colored-man-pages
  colorize
  command-not-found
  copybuffer
  docker
  emoji
  encode64
  extract
  git-extras
  golang
  httpie
  iterm2
  jsontools
  npm
  macos
  pip
  safe-paste
  sublime
  tmux
  urltools
)

source "$ZSH/oh-my-zsh.sh"

export LANG=en_US.UTF-8
export EDITOR='vim'

if command -v gls >/dev/null 2>&1; then
  alias l="gls -lhG --group-directories-first --color=auto"
  alias la="gls -lhaG --group-directories-first --color=auto"
else
  alias l="ls -lhG"
  alias la="ls -lhaG"
fi

alias t="tmux"
alias ag="rg"

alias gs="git status"
alias gb="git branch"
alias ga="git add -p"
alias gd="git icdiff"
alias gl="git --no-pager log --oneline -n 5"
alias gll="git --no-pager log --oneline -n 25"
alias gc="git commit -m"

# delete every local branch except master or main
git-delete-branches() {
  git branch --format="%(refname:short)" \
    | grep -Ev '^(master|main)$' \
    | xargs -r git branch -D
}

# Load machine-local aliases, exports, secrets, and overrides.
[ -f ~/.localprofile ] && source ~/.localprofile

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Make it so that git autocomplete never makes remote calls for auto-complete
__git_heads_remote() {}

# Prompt https://github.com/sindresorhus/pure
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit
promptinit

PURE_CMD_MAX_EXEC_TIME=10
zstyle :prompt:pure:path color white
zstyle :prompt:pure:git:branch color yellow
zstyle ':prompt:pure:prompt:*' color cyan
zstyle :prompt:pure:git:stash show yes

prompt pure
