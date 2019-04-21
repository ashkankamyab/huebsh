
# Simplified commandline
alias ll='ls -lhaF'
alias cls='clear'
alias rm='rm -I'
alias tlp='$sudo_cmd tlp start'
alias tlp-stat='$sudo_cmd tlp stat'
alias vsc='code .'
alias atm='atom .'
#alias open='nautilus .' #Works only when you have Gnome
alias SimpleServer='python3 -m http.server 8070'
alias BS='browser-sync start --directory --server --ui-port 8991 --port 8990 --files "**/*.js, **/*.html, **/*.css"'
alias myServer='youruser@yourdmoain'
# https://ubuntuforums.org/showthread.php?t=1229355
alias khnb='mplayer -geometry 100%:100% -noborder -ontop -tv driver=v4l2:gain=1:width=320:height=240:device=/dev/video0:fps=20:outfmt=rgb32 tv://'


# Git Aliases
alias git-stat='git status'
alias git-log='git log'
alias git-commit='git add -A && git commit --allow-empty'


## Directory selector
alias prj='cd ~/Documents/Projects/;clear'
alias vgr='cd ~/Documents/Vagrant;clear'



# https://www.commandlinefu.com/commands/view/24360/open-clipboard-content-on-vim
# TODO: xclip
#alias vcb='xclip -i -selection clipboard -o | vim -'

# https://www.commandlinefu.com/commands/view/24315/list-all-global-top-level-modles-then-remove-all-npm-packages-with-xargs
## TODO: grep -m1 -h [0-9] /etc/{*elease,issue} 2>/dev/null | head -1

# TODO: file extention funtion
# https://www.commandlinefu.com/commands/view/24307/find-all-file-extension-in-current-dir.

# alias nowrooz=' $sudo_cmd apt-get update &&  $sudo_cmd apt-get upgrade'
# alias behrooz=' $sudo_cmd apt-get autoclean &&  $sudo_cmd apt-get autoremove'
# alias nowbeh='nowrooz && behrooz'
