# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="ys"
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ***********************************************************************
# My Configurations.
# ***********************************************************************
#
# **************************************
# Environment Variables.
# **************************************
# ictt server.
export serverIp=10.195.179.204
export serverPort=2376

# proxy.
proxyPort=9981
proxyHost="http://127.0.0.1"

# **************************************
# Alias.
# **************************************

# alias dockerh="sudo docker -H=10.193.221.129:2375"
alias dockerH="sudo docker -H=${serverIp}:${serverPort}"

# time command
time=$(which time)
if [ -x ${time} ];then
	alias time="${time}"
fi

# xdg-open -> open
open=$(which 'xdg-open')
if [ $? -eq 0 ];then
	if [ -x ${open} ];then
		alias open="${open}"
	fi
fi

# vi -> vim 
vi=$(which 'vim')
if [ $? -eq 0 ];then
	if [ -x ${vi} ];then
		alias vi="${vi}"
	fi
fi

# google-chrome -> chrome
chrome=$(which 'google-chrome')
if [ $? -eq 0 ];then
	if [ -x ${chrome} ];then
		alias chrome="${chrome}"
	fi
fi

# sublime. 
sublime=$(which 'sublime_text')
if [ $? -eq 0 ];then
	if [ -x ${sublime} ];then
		alias sublime="${sublime}"
	fi
fi

# bat -> cat (use bat, rather than cat).
bat=$(which 'bat')
if [ $? -eq 0 ];then
	if [ -x ${bat} ];then
		alias cat="${bat} --paging=never"
	fi
fi

# gawk -> awk. 
gawk=$(which 'gawk')
if [ $? -eq 0 ];then
	if [ -x ${gawk} ];then
		alias awk="${gawk}"
	fi
fi

# proxy.
export http_proxy="${proxyHost}:${proxyPort}"  
export https_proxy="${proxyHost}:${proxyPort}" 
export socks_proxy="socks5://${proxyHost}:${proxyPort}" 
# export all_proxy="socks5://${proxyHost}:${proxyPort}"

# viu.
export PATH=$HOME/.cargo/bin:$PATH

# ---- some work directory -----
# export note=/home/mujueke/Documents/Cpachecker/note
# export papers=/home/mujueke/Documents/Papers

# vim runtime.
# export VIMRUNTIME=/usr/share/vim/vim82/

# nnn.
export NNN_COLORS="1234"
export NNN_FCOLORS="c1e2272e006033f7c6d6abc4"
export NNN_TRASH=2

# nnn plugins.
export NNN_PLUG="n:nuke;j:autojump;d:diffs"

# plug jump.
eval "$(jump shell)"

# bat.
export BAT_THEME="Coldark-Cold"

# clangd.
export PATH=$PATH:/usr/bin/clangd

# jedi.
export PATH=$PATH:$HOME/.local/bin

# go.
export PATH=$PATH:/usr/local/go/bin

# token chatgpt.
OPENAI_TOKEN=$(find ~/mmm/sh -name 'openai_token')
if [ -e ${OPENAI_TOKEN} ];then
	export GPTTOKEN=${OPENAI_TOKEN}
fi

# git.
alias config="$(which git) --git-dir=$HOME/.myConfig --work-tree=$HOME"

# for xauth, if not set, then $XAUTHORITY will be empty.
# export XAUTHORITY=$HOME/.Xauthority
# export DISPLAY=:1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
