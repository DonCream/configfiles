#Enviornmental Variables
#Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh
#Allow colors in terminal
  export TERM="xterm-256color"
#Path to user installed software 
  export PATH=$PATH:/usr/local/bin
  export PATH=$PATH:/opt
#Default user
  export DEFAULT_USER=`whoami`
#Default text editor is nano
  export EDITOR=nano
#Path to LinuxBrew
  export PATH="$HOME/.linuxbrew/bin:$PATH"
  export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
#Global Node Modules access
  export PATH="$HOME/.node_modules_global/bin:$PATH"
#SSH
# export SSH_KEY_PATH="~/.ssh/rsa_id"

#Load nerd-fonts and awesome-fonts
  POWERLEVEL9K_MODE='nerdfont-complete'
  POWERLEVEL9K_MODE='awesome-fontconfig'

# Set name of the theme to load, or to "random" for random theme
  ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of random themes to load if theme is set to "random"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

#Plugins to load (plugins can be found in ~/.oh-my-zsh/plugins/*)
  plugins=( dotenv extract git git-extras vagrant yarn zsh-autosuggestions )

source $ZSH/oh-my-zsh.sh

#Load autosuggestions plugin
source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#User specific aliases and functions
#File and Directory commands
#ls variants
#long listing without group + size
  alias la='ls -alhG'
#list in columns with directories first
  alias ll='ls -aC --group-directories-first'
#list inode numbers(for identifying hard   link files)
  alias li='ls -ai'
#list only directories
  alias ld='ls -l | grep ^d'

#move and remove
#prompt before moving
  alias mv='mv -i'
#prompt before removing
  alias rm='rm -i'
#prompt before copying
  alias cp='cp -i'

#System Commands
#show filesystem info with individual size and total
  alias dt='df -hT'
#show files with size 1 level deep (the current folder)
  alias dul='du -h --max-depth=1'
#clears the screen
  alias clr='reset'
#reloads zshrc file
  alias reload='source .zshrc'
#moves to home directory
  alias home='cd ~'

#Network Commands
  alias ping='ping -c6'

#User and Group Commands
#add user to a single group(won't change current group or remove from other groups)
  alias addgrp='usermod -a -G'
#list all groups on the system
  alias grplist='cut -d: -f1 /etc/group'

#clone dev themes and projects from github
  alias devstart='git clone https://github.com/DonCream/LMTheme.git'
#clone VVV
  alias vvv='git clone http://github.com/Varying-Vagrant-Vagrants/VVV.git'
#clone VV Dashboard
  alias dashboard='git clone https://github.com/topdown/VVV-Dashboard.git'

## POWERLEVEL9K SETTINGS ##
#Show OS info when opening a new terminal
  neofetch

#WiFi signal color display icon(issaplane)
zsh_wifi_signal(){
  local signal=$(nmcli device wifi | grep yes | awk '{print $8}')
  local SNR=$(bc <<<"scale=2; $signal  $noise")
  local net=$(curl -D- -o /dev/null -s http://www.google.com | grep HTTP/1.1 | awk '{print $2}')
  local color='%F{yellow}'
  local symbol="直"

  # Excellent Signal (5 bars)
  if [[ ! -z "${signal// }" ]] && [[ $SNR -gt .40 ]] ;
    then color='%F{green}' ; symbol="直" ;
  fi

  # Good Signal (3-4 bars)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .40 ]] && [[ $SNR -gt .25 ]] ;
    then color='%F{cyan}' ; symbol="直" ;
  fi

  # Low Signal (2 bars)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .25 ]] && [[ $SNR -gt .15 ]] ;
    then color='%F{yellow}' ; symbol="直" ;
  fi

  # Very Low Signal (1 bar)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .15 ]] && [[ $SNR -gt .10 ]] ;
    then color='%F{yellow}' ; symbol="直" ;
  fi

  # No Signal - No Internet
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .10 ]] ;
    then color='%F{red}' ; symbol="睊";
  fi

  if [[ -z "${signal// }" ]] && [[ "$net" -ne 200 ]] ;
    then color='%F{red}' ; symbol="睊" ;
  fi

  # Ethernet Connection (no wifi, hardline)
  if [[ -z "${signal// }" ]] && [[ "$net" -eq 200 ]] ;
    then color='%F{green}' ; symbol="直" ;
  fi

  echo -n "%{$color%} $symbol " # \f1eb is wifi bars \uf197 is a plane
}

## Left prompt  ##
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status custom_os_icon user  virtualenv dir vcs)
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0B0'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{cyan}\u256D\u2500%F{white}"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{cyan}\u2570\uF460\uF460\uf460%F{white} "

# Status
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_OK_ICON=$'\uf164'
POWERLEVEL9K_FAIL_ICON=$'\uf165'
POWERLEVEL9K_CARRIAGE_RETURN_ICON=$'\uf165'

# OS icon
POWERLEVEL9K_CUSTOM_OS_ICON='echo '
POWERLEVEL9K_CUSTOM_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_CUSTOM_OS_ICON_FOREGROUND="019"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

# VCS CONFIG
POWERLEVEL9K_SHOW_CHANGESET=false

# VCS colours
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='cyan'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'

##  Right prompt  ##
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(load ram custom_wifi_signal)
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND="black"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_FOREGROUND="white"
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="black"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="black"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="black"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="007"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="007"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="007"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_RAM_ELEMENTS=(ram_free)
POWERLEVEL9K_RAM_BACKGROUND="black"
POWERLEVEL9K_RAM_FOREGROUND="white"
POWERLEVEL9K_RAM_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0B2'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
