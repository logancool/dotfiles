## THEME
ZSH_THEME="suvash"

## ALIAS
alias c="clear"
alias reset-ports="lsof -ti:3000,3001,8080,5050,5051 | grep LISTEN | awk '{print $2}' | xargs kill -9"
alias no="rm yarn.lock; rm -rf node_modules"

alias pas="cd ~/stitchfix/page-author-service"
alias pasp="cd ~/stitchfix/page-author-service-proxy"
alias ez="code $HOME/.zshrc"
alias prune-branches="git branch --merged main | grep -v '^[ *]*main$' | xargs git branch -d"
alias gmc= 'git merge --continue'
git config --global alias.ignore 'update-index --skip-worktree'
alias kui="z kept-items"

#### PATHS ####
export PATH="/usr/local/opt/qt@5.5/bin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
PATH=$PATH:/usr/local/sbin
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/Users/logancool/.oh-my-zsh"

## YARN 
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# POSTGRES
export PATH="/usr/local/opt/postgresql@9.4/bin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"

## RUBY

## GO
export PATH="$PATH:$HOME/go/bin"
export GOPATH="$HOME/go/"

## NPM
autoload -Uz compinit; compinit # Needed for nvm bash_completion

export NPM_TOKEN="xxx"  
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

## Auto Switch NPM
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm current
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

## PLUGINS
plugins=(git z zsh-syntax-highlighting zsh-autosuggestions fzf ssh-agent)

## Congifurations
zstyle :compinstall filename '/Users/logancool/.zshrc'
. /usr/local/opt/z/etc/profile.d/z.sh # for z
source $ZSH/oh-my-zsh.sh

#FZF BINDINGS
bindkey '^R' fzf-history-widget

## Get Custom git-prompt
source ~/gitprompt.sh

## END OF ZSHRC

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"