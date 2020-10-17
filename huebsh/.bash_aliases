implified commandline
alias ll='ls -lhaF'
alias cls='clear'
alias rm='rm -I'
alias tlp='$sudo_cmd tlp start'
alias tlp-stat='$sudo_cmd tlp stat'
alias vsc='code .'
alias atm='atom .'


alias emailGrep='grep -E -o "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b"'
alias ipGrep='grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"'
alias SimpleServer='python3 -m http.server 8080'
alias BS='browser-sync start --directory --server --ui-port 8991 --port 8990 --files "**/*.js, **/*.html, **/*.css"'
# https://ubuntuforums.org/showthread.php?t=1229355
alias khnb='mplayer -geometry 100%:100% -noborder -ontop -tv driver=v4l2:gain=1:width=320:height=240:device=/dev/video0:fps=20:outfmt=rgb32 tv://'
alias jsonpy="python3 -m json.tool"
alias doit="du --si --exclude=/{dev,proc,sys,mnt,run} /* --max-depth=3 -t 2G"


# Git Aliases
alias git-stat='git status'
alias git-log='git log'
alias git-commit='git add -A && git commit --allow-empty'
alias gl='git log --oneline --all --graph --decorate $*'
alias git-clean-branches="for branch in `git branch | grep $1 | awk '{print $1}'`; do git branch -D $branch; done"


## Directory selector
alias prj='cd ~/Documents/Projects/;clear'
alias vgr='cd ~/Documents/Vagrant;clear'


# SysOps
# https://www.commandlinefu.com/commands/view/24360/open-clipboard-content-on-vim
alias vimx='xclip -i -selection clipboard -o | vim -'

# TODO:  Destro compatibility
# alias nowrooz=' $sudo_cmd apt-get update -qq &&  $sudo_cmd apt-get upgrade -yqq'
# alias behrooz=' $sudo_cmd apt-get autoclean  -q &&  $sudo_cmd apt-get autoremove -q'
# alias nowbeh='nowrooz && behrooz'
# Log Compresser
alias logpresser="for file in `find . -mtime +15 -type f ! -name '*.log' -printf '%P\n';`;do lsof $file>/dev/null;is=$?;if [ $is -ne 0 ];then gzip $file;echo File gzipped: $file;else echo File being used:$file;fi;done"

