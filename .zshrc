### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#################################################################
# FUNCTIONS TO MAKE CONFIGURATION LESS VERBOSE
#

turbo0()   { zinit ice wait"0a" lucid             "${@}"; }
turbo1()   { zinit ice wait"0b" lucid             "${@}"; }
turbo2()   { zinit ice wait"0c" lucid             "${@}"; }
zload()    { zinit light                          "${@}"; }

#################################################################


# Theme
zinit ice depth=1
zload romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# syntax highlight
turbo2 atinit"ZINIT[COMPINIT_OPTS]='-i' zpcompinit; zpcdreplay"
zload zdharma/fast-syntax-highlighting

# lscolor
eval $(gdircolors -b $HOME/.dircolors)

# z
turbo1; zload rupa/z
# Ctrl+G
turbo0; zload andrewferrier/fzf-z
# zz
turbo0; zload changyuheng/fz

# Completions
turbo0 blockf
zload zsh-users/zsh-completions
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

turbo0 atload"_zsh_autosuggest_start"
zload zsh-users/zsh-autosuggestions

function __bind_history_keys() {
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
}
turbo0 atload'__bind_history_keys'
zload zsh-users/zsh-history-substring-search

# Ctrl+r
turbo1; zload zdharma/history-search-multi-word

# History config
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

# Basic ENV
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin"
export MANPATH="/usr/local/man:$MANPATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export CLICOLOR=1

# Homebrew
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

# Android
# export PATH="$HOME/Library/Android/sdk/platform-tools:${PATH}"
# export PATH="$HOME/Library/Android/sdk/tools:${PATH}"
# export PATH="$HOME/Library/Android/sdk/ndk-bundle:${PATH}"
# export ANDROID_HOME=$HOME/Library/Android/sdk

# Python
alias py3="python3"
alias pip="pip3"
alias pup="pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U"
export PYTHONUSERBASE=~/.pip
export PATH="$PYTHONUSERBASE/bin:${PATH}"

# Go
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Alias
# System
alias cp="cp -i"
alias ls="gls -F --color=auto"
alias mv="mv -i"
alias grep="grep --color=auto"
alias less="less -R"
alias rm="trash"
alias tmuxrc="nvim ~/.tmux.conf"
alias vim="nvim"
alias vimrc="nvim ~/.vimrc"
alias zshrc="nvim ~/.zshrc"
alias tmuxrc="nvim ~/.tmux.conf"
function mkcd { mkdir -p "$@" && cd "$@";  }
function push { git a . && git cm "$@" && git push }

# Folder
alias rr="cd /Volumes/RamDisk/"
alias site="cd ~/Sites"

# Docker
alias ctf="docker start ctf && docker exec -it ctf tmux"
function dkrm { docker kill "$@" && docker rm "$@" }

# Apple
alias cask="brew cask"
alias launch="defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock"
alias update="brew upgrade ; cask upgrade ; pup ; yarn global upgrade ; launch"

# Snippet
alias c="code ."
alias myip="curl ipinfo.io"
