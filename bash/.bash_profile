[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

alias bex='bundle exec'
alias ber='bundle exec rspec'
alias beru='bundle exec rubocop'
alias gk='gitk --all &'
alias loc_conn='bin/rails s puma -p 3001'
alias rem='git remote -v'
alias dev_logs='tail -f log/development.log'
alias md34='/Applications/mongodb/bin/mongod'
alias els='/Applications/elasticsearch-6.2.2/bin/elasticsearch'
alias kib='/Applications/kibana-6.2.2-darwin-x86_64/bin/kibana'
alias fs='foreman start'
alias java8='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home'
alias java11='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.2.jdk/Contents/Home'
alias fv='nvim $(fzf)'
alias n='nvim'
alias nconf='n ~/.config/nvim/init.vim'

function gp {
  git pull ${1:-mas} ${2:-master}
}


function gco {
  git co ${1:-master}
}

function gf {
  git fetch ${1:-mas}
}

function mas {
  cd "$HOME/mas-projects/${1:-frontend}"
}

function dir {
  cd "$HOME/${1:-spikes}"
}
# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export FZF_DEFAULT_COMMAND='ag %s -l --nocolor -g ""'

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# git-completion
source ~/.git-completion.bash

# Editor config
export VISUAL=nvim
export EDITOR="$VISUAL"

source ~/.bashrc

export PATH="~/.rbenv/bin:$PATH"

eval "$(rbenv init -)"
