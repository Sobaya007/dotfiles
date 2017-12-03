#set -x LANG=ja_JP.UTF-8
#
## Set up the prompt
##setopt PROMPT_SUBST
##source ~/git-prompt
##GIT_PS1_SHOWDIRTYSTATE=true
##PROMPT='
##[1;36m[%~]
##[38;5;83m[⭠$(__git_ps1 "%s")]
##[1;33m$%F{reset_color}'
##
##bindkey -v
##
### Use modern completion system
##autoload -Uz compinit
##compinit -C

#Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'

# Status Chars
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '#'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'
#user aliases
alias dein='cd ~/.vimfiles/dein/dein.vim/repos/github.com/'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias grep='grep --color'
alias so='source'
alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gd='git diff'
alias gg='git log --graph --all'
alias gm='git merge'
alias gs='git status'
alias gu='git submodule update'
alias gstash='git stash'
alias glist='git stash list'
alias gpop='git stash pop'
alias gcom='git commit'
alias sabac='ssh -i "TokyoSaba.pem" ec2-user@ec2-52-199-205-172.ap-northeast-1.compute.amazonaws.com'
alias sabasftp='sftp -i "TokyoSaba.pem" ec2-user@ec2-52-199-205-172.ap-northeast-1.compute.amazonaws.com'
#alias color='for code in {000..255}; do print -nP -- "%F{$code}$code %f"; [ $((${code} % 16)) -eq 15 ] && echo; done'
alias ldc='ldc2'

switch (uname)
case Darwin
    alias ls='ls -G'
    alias la='ls -aG'
    alias ll='ls -lG'
    set -x PATH $PATH $HOME/dmd2/osx/bin
case '*'
    alias ls='ls --color=auto'
    alias la='ls -a --color=auto'
    alias ll='ls -la --color=auto'
    alias chrome='/mnt/c/Program Files (x86)/Google/Chrome Dev/Application/chrome.exe'
    alias dmd='dmd.exe'
    alias rdmd='rdmd.exe'
    alias dub='dub.exe'
    alias cmake='cmake.exe'
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
end
#set -x DISPLAY=localhost:0.0
#LESS=' -R '
#LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh %s'
#
set -x GOPATH $HOME/go
#set -x PATH $PATH $GOPATH/bin
set -x BROWSER '/mnt/c/Program Files (x86)/Google/Chrome Dev/Application/chrome.exe'

set -x VIM '/usr/local/Cellar/neovim/0.2.0_1/share/nvim'
source $HOME/.cargo/env
