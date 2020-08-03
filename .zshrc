## THEME
ZSH_THEME="suvash"

## ALIAS
op() {
   THIS_DIR=$(basename $PWD)
   case "$1" in
       git)
           open "https://github.com/stitchfix/dynamic-shock/$THIS_DIR"
           ;;
       circle)
           open "https://circleci.com/gh/stitchfix/$THIS_DIR"
           ;;
       pr)
           open "https://github.com/stitchfix/$THIS_DIR/pulls"
           ;;
   bugs)
     open "https://app.bugsnag.com/stitch-fix-1/$THIS_DIR"
     ;;
   esac
}

alias c="clear"
alias pas="cd ~/stitchfix/page-author-service"
alias pasp="cd ~/stitchfix/page-author-service-proxy"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias ez="subl $HOME/.zshrc"
alias prune-branches="git branch --merged master | grep -v '^[ *]*master$' | xargs git branch -d"
alias mm='open -a "Google Chrome" http://magic-mirror.vertigo.stitchfix.com/raw/github/stitchfix/dynamic-shock/$(git describe --contains --all HEAD)-storybook-site/'
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
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

## GO
export PATH="$PATH:$HOME/go/bin"
export GOPATH="$HOME/go/"

## NPM
autoload -U compinit; compinit # Needed for nvm bash_completion

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
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

## PLUGINS
plugins=(git z fzf ssh-agent)

## Congifurations
zstyle :compinstall filename '/Users/logancool/.zshrc'
. /Users/logancool/z.sh # for z
source $ZSH/oh-my-zsh.sh

#FZF BINDINGS
bindkey '^R' fzf-history-widget

## Get Custom git-prompt
source ~/.gitprompt.sh

## END OF ZSHRC