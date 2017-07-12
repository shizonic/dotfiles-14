source <(antibody init)

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 1
zstyle :compinstall filename '/home/benj/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

antibody bundle mafredri/zsh-async

antibody bundle sindresorhus/pure
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-history-substring-search

export NVM_LAZY_LOAD=true
antibody bundle lukechilds/zsh-nvm

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
source /etc/profile.d/autojump.zsh

export PATH=~/.bin:$PATH

alias ls="ls --color"

alias la="ls -lha"
alias ll="ls -lh"
alias l="ls"
