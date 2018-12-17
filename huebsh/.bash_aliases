# Root user detection
if [ $(echo "$UID") = "0" ]; then
    sudo_cmd=''
else
    sudo_cmd='sudo'
fi

source .bash_functions


# Simplified commandline
alias ll='ls -lhaF'
alias cls='clear'
alias rm='rm -I'
alias tlp='$sudo_cmd tlp start'
alias tlp-stat='$sudo_cmd tlp stat'
alias vsc='code .'
alias atm='atom .'
alias SimpleServer='python3 -m http.server'
alias myServer='youruser@yourdmoain'
alias khnb='mplayer -geometry 100%:100% -noborder -ontop -tv driver=v4l2:gain=1:width=320:height=240:device=/dev/video0:fps=20:outfmt=rgb32 tv://'



# Git Aliases
alias git-stat='git status'
alias git-commit='git add -A && git-commit-all'


## Directory selector
alias prj='cd ~/Documents/Projects/'
alias vgr='cd ~/Documents/Vagrant'


# alias nowrooz=' $sudo_cmd apt-get update &&  $sudo_cmd apt-get upgrade'
# alias behrooz=' $sudo_cmd apt-get autoclean &&  $sudo_cmd apt-get autoremove'
# alias nowbeh='nowrooz && behrooz'
