# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"

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
plugins=(
  git 
  zsh-autosuggestions
  zsh-syntax-highlighting
  autojump
  fzf
)

source $ZSH/oh-my-zsh.sh

# ------ PATH setting ------
export PATH="/Users/ao/Program/bin:/Users/ao/Program/script:$PATH"
# Homebrew
export PATH=/opt/homebrew/bin:$PATH
# Android Tools
export PATH='/Users/ao/Documents/scripts/':'/Users/ao/Library/Android/sdk/platform-tools/':$PATH
# no proxy
export no_proxy="localhost, 127.0.0.1"

# ------ alias ------
alias hot_mac='sysbench cpu run --threads=12 --time=200' # mac too cold
alias wd="wget -q -O - sakura.lan:5000"
#alias setssr="export all_proxy=http://127.0.0.1:18889"
alias wechat="nohup /Applications/WeChat.app/Contents/MacOS/WeChat > /dev/null 2>&1 &"
alias unsetssr="unset all_proxy && unset ALL_PROXY"
alias rm="rm -i"
alias d="cd ~/Desktop/"
alias updatedb='/usr/libexec/locate.updatedb'
alias VIM=nvim
alias vim=nvim
alias n=nvim
alias unsetssr="unset all_proxy && unset ALL_PROXY"
alias mypip="pip3 install -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com"
# watch setting
alias watch="watch --color"
# disk healthy
alias disk="smartctl -a disk0"
# VScode 
alias code="/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron"
alias diff=colordiff
alias software_update="brew update --auto-update && brew upgrade && brew cu -a -y"

# conda 
alias my_env="conda activate my_env"

# sleep option
alias disablesleep2disk="sudo pmset -a hibernatemode 0 standby 0 autopoweroff 0 disablesleep 0" # allow to sleep to RAM
alias enablesleep="sudo pmset -a restoredefaults && sudo pmset -a disablesleep 0" # reset ALL
alias disablesleep="sudo pmset -a disablesleep 1"
# alias resetsleep="sudo pmset -a restoredefaults" # reset pmset
# graphic card setting
alias use_amd_gpu="sudo pmset -a gpuswitch 1" # AMD -b battery -c charge -a all
alias use_intel_gpu="sudo pmset -a gpuswitch 0" # Intel
alias use_auto_gpu="sudo pmset -a gpuswitch 2" # Auto
# RAM to disk
alias RAM_8G="diskutil erasevolume HFS+ 'RAM Disk' `hdiutil attach -nobrowse -nomount ram://16777216`"
# fast aria2c
alias a="aria2c-fast -U 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0) Gecko/20100101 Firefox/78.0' -x 64 -s 64 -c"
alias a_no_head="aria2c-fast -x 64 -s 64 -c"
alias help=tldr
# Brew setting 
alias brew_tsu="export HOMEBREW_BREW_GIT_REMOTE='https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git'&&export HOMEBREW_BOTTLE_DOMAIN='https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles'"
alias brew_no_update="export HOMEBREW_NO_AUTO_UPDATE=true"
alias my_brew="brew_tsu;brew_no_update"
alias youtube_mkv='yt-dlp  --external-downloader aria2c --remux-video mkv'
#alias youtube_mkv='yt-dlp  --external-downloader aria2c --remux-video mkv --proxy  "http://127.0.0.1:18889/"'
alias youtube='yt-dlp  --external-downloader aria2c --remux-video mp4'
#alias youtube='yt-dlp  --external-downloader aria2c --remux-video mp4 --proxy  "http://127.0.0.1:18889/"'
# Apache anime server
alias anime_on='sudo apachectl start'
alias anime_off='sudo apachectl stop'
alias g="glances -p 8091 -w"
alias d='cd ~/Desktop/'
# arknights
#alias phone='~/Library/Android/sdk/emulator/emulator -avd Desktop_API_33 -gpu host -no-boot-anim -no-cache -noskin -no-snapstorage  -no-snapshot-save -no-snapshot-load -no-snapshot-update-time'
alias vim=nvim
alias v=nvim
alias m=mpv
# add . to python path for debug
alias add_path_to_PYTHONPATH='export PYTHONPATH=`pwd`:$PYTHONPATH'
alias whatsmyip='curl ipinfo.io'
alias c="clear"
alias p="python"
alias o="open"
alias sha256="openssl dgst -sha256"
alias sha512="openssl dgst -sha512"
alias sha3-512="openssl dgst -sha3-512"
alias wget_firefox="wget  -U 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0) Gecko/20100101 Firefox/78.0'"
alias h="htop"
alias du1="du -hd1"
alias hexedit="hexedit --color"
alias b='bpytop'
alias QRdecode="zbarimg"
alias QRcode="qr"
alias open_ssh="sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist"
alias close_ssh="sudo launchctl unload -w /System/Library/LaunchDaemons/ssh.plist"
alias clean_pip="rm -rf ~/Library/Caches/pip/*"
alias ll='ls -alh'
alias anime_on="sudo apachectl start"
alias anime_off="sudo apachectl stop"
# ------ extra ------
# locale
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
# java
JAVA_TOOL_OPTIONS="-Dsun.java2d.opengl=true"
# jupyter
export LANG="zh_CN"
export LC_CTYPE="zh_CN.UTF-8"
# history file
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
# editor
export VISUAL=nvim
export EDITOR=nvim
#export PAGER='most'
export PATH=$PATH:$HOME/Program/jetbrain
export PATH="/opt/homebrew/Cellar/openjdk/bin:$PATH"
export LANG="zh_CN.UTF8"
export TLDR_AUTO_UPDATE_DISABLED=1

# Conda
export CONDA_PREFIX='/usr/local/anaconda3/'

# zsh-completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi
# zsh-completions 

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# inshellisense --shell zsh
#[ -f ~/.inshellisense/key-bindings.zsh ] && source ~/.inshellisense/key-bindings.zsh
# ------ action ------
my_env
#setssr

export PATH="$PATH:/Applications/010 Editor.app/Contents/CmdLine" #ADDED BY 010 EDITOR
