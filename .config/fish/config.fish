﻿#set -x LANG=ja_JP.UTF-8
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
alias gg='git log --graph --all --decorate'
alias gm='git merge'
alias gs='git status'
alias gu='git submodule update'
alias gstash='git stash'
alias glist='git stash list'
alias gpop='git stash pop'
alias gcom='git commit'
#alias color='for code in {000..255}; do print -nP -- "%F{$code}$code %f"; [ $((${code} % 16)) -eq 15 ] && echo; done'
alias ldc='ldc2'

switch (uname)
case Darwin
    alias ls='ls -G'
    alias la='ls -aG'
    alias ll='ls -lG'
    set -x PATH $PATH $HOME/dmd2/osx/bin
    set -x VIM '/usr/local/Cellar/neovim/0.2.0_1/share/nvim'
case '*'
    alias ls='ls --color=auto'
    alias la='ls -a --color=auto'
    alias ll='ls -la --color=auto'
    set -x PATH $PATH /opt/cuda/bin
end
set -x GOPATH $HOME/go
set -x NODE_PATH (npm root -g)
set -x PKG_CONFIG_PATH /usr/local/lib/pkgconfig/

#source $HOME/.cargo/env

# start tmux
if status --is-interactive
    tmux new-session
end 

# load DMD
if test -e ~/dlang/dmd-2.090.0
    source ~/dlang/dmd-2.090.0/activate.fish
    functions -e fish_prompt
    functions -c _old_d_fish_prompt fish_prompt
    functions -e _old_d_fish_prompt
end
#
# load LDC
if test -e ~/dlang/ldc-1.19.0
    source ~/dlang/ldc-1.19.0/activate.fish
    functions -e fish_prompt
    functions -c _old_d_fish_prompt fish_prompt
    functions -e _old_d_fish_prompt
end

## CUDA and cuDNN paths
if test -e /usr/local/cuda-8.0
    set PATH /usr/local/cuda-8.0/bin $PATH
    set LD_LIBRARY_PATH /usr/local/cuda-8.0/lib64 $LD_LIBRARY_PATH
end

# for npm
if test -e ~/.npm-global/bin
    set PATH ~/.npm-global/bin $PATH
end

set PATH /snap/bin $PATH

# for WSL
umask 022
