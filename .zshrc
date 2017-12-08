DOTDIR="$(cd $(dirname "$_") && pwd  )"

export ZSH=/Users/mdonat/.oh-my-zsh

ZSH_THEME="robbyrussell"
ZSH_THEME="maran"

ENABLE_CORRECTION="true"
#COMPLETION_WAITING_DOTS="true"

plugins=(git docker osx yarn)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

NEWLINE=$'\n'
PROMPT="${PROMPT}${NEWLINE} -> "

compctl -g '~/.itermocil/*(:t:r)' itermocil

export GOPATH=/Users/mdonat/GOPATH
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

func secrets() {
    source $DOTDIR/.secrets
}

source $DOTDIR/.util
source $DOTDIR/.keypad
source $DOTDIR/.kuberc
source $DOTDIR/.uw


cd ~/Development
