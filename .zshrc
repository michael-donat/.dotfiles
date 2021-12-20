DOTDIR="$(cd $(dirname "$_") && pwd  )"

export ZSH=/Users/mikey/.oh-my-zsh

ZSH_THEME="robbyrussell"
ZSH_THEME="maran"

#ENABLE_CORRECTION="true"
#COMPLETION_WAITING_DOTS="true"

plugins=(git docker macos yarn)

source $ZSH/oh-my-zsh.sh

NEWLINE=$'\n'
PROMPT="${PROMPT}${NEWLINE} -> "

compctl -g '~/.itermocil/*(:t:r)' itermocil

func secrets() {
    source $DOTDIR/.secrets
}

eval "$(/opt/homebrew/bin/brew shellenv)"

source $DOTDIR/.util
source $DOTDIR/.keypad
source $DOTDIR/.kuberc

DHOME=~/Development

cd $DHOME
