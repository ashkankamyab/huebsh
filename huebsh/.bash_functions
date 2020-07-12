## Git Functions

function git-commit(){
    if [ -n $1 ]; then
        git commit -m "$1"
    else
        git commit --allow-empty-messag
    fi
}

function git-commit-push(){
  git-commit $1
  git push --set-upstream origin $(git_current_branch)
}


# https://www.ibm.com/developerworks/community/blogs/ac33fe4b-e8f6-48d6-8a93-2d4f63b264ed/entry/handy_bash_functions_history_grep?lang=en
function hgrep () {
    history | grep ${*:1}
}

# SASS by stefan.klinkusch@googlemail.com
function sassy {
  node-sass --watch --recursive --source-map-contents "$1" --output "$2 --source-map true"
}


# Web Development basic assets
# TODO: Creating basic HTML template
function assets () {
    mkdir -p assets/css assets/js assets/img
    touch index.html assets/css/$1.css assets/js/$2.js
    git init && echo "node_modules/" > .gitignore
}

# IPv4 v6 aliases may work as a Function
function myIps() {
    if [ -z $1 ]; then
        echo "\033[1;31m Private v4:  \033[1;36m$(ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | sed -n 2p)"
        echo "\033[1;31m Public  v4:  \033[1;36m$(curl -s www.icanhazip.com)"
        printf "%`tput cols`s"|sed "s/ /-/g"
        echo "\033[1;31m Private v6:  \033[1;36m$(ip add sh | grep -oP '(?<=inet6\s).{1,4}:+(:.{1,4}){4}' | sed -n 1p)"
        #echo "\033[1;31mPublic v6:  \033[1;36m$(curl -s www.icanhazip6.com)
    else
        if [ $1 -ne 4 -a $1 -ne 6 ]; then
            echo "\033[1;31m Error! \033[1;36m: Wrong Argument"
            echo " $1 is not supported, please check the usage"
            echo " Usage: myIps 6 or myIps 4"
        else
            if [ $1 -eq 4 ]; then
                echo "\033[1;36m Private:  \033[1;31m$(ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | sed -n 2p)"
                echo "\033[1;36m Public:   \033[1;31m$(curl -s www.icanhazip.com)"
            else
                echo "\033[1;36m Private:  \033[1;31m$(ip add sh | grep -oP '(?<=inet6\s).{1,4}:+(:.{1,4}){4}' | sed -n 1p)"
                #echo "\033[1;36m Public:   \033[1;31m$(curl -s www.icanhazip6.com)"
            fi
        fi
    fi
}


#TODO: lets create a function for wirless activity from command line:
function wlanConnect() {
    #TODO: Check whether sudo_cmd necessarily should implement here
    if [ $(echo "$UID") = "0" ]; then
        sudo_cmd=''
    else
        sudo_cmd='sudo'
    fi
    red='\033[1;31m'
    gray='\033[1;36m'
    #TODO: extract Wireless Name
    WLANID=$(ip link sh | grep wl | awk '{print $2}' | sed 's/\://g')
    #TODO: make list of reachable SSIDs
    WLANLIST=$(iwlist $WLANID scan | grep ESSID | cut -f 2 -d ":" | sed 's/\"//g')
    if [ -z $1 ];then
        echo "$red ERROR: $gray Please Give a correct $red Arguement$gray \nUsage:\n       wlanConnect watch -> To have a list of available Wireless Networs\n       wlanConnect $red SSID $red ShareKey -> $gray Connect to you desired Network"
        echo "$red Important"
    elif [ -z $2 -a "$1" = "watch" ];then
        echo "$red $WLANLIST $gray"
    elif [ -n $1 -a -n $2 ]; then
        $sudo_cmd iwconfig $WLANID essid $1 key s:$2

    elif [-n $1 -a -z $2 ]; then
        #$iwconfig $WLANID essid $1 key s:$2
        #TODO: Connecting to CaptivePortal WLANs
        echo "$red Not Supported yet, $gray We are extremly under Development"
    fi
}

function AngryIp() {
  nmap -sn $(ip addr list | awk '/inet.*brd/ {print $2}') -oG - | awk '$4=="Status:" && $5=="Up" {print $0}'|column -t
}
function rsbranch() {
    for branch in `git branch | grep $1 | awk '{print $1}'`; do git branch -D $branch; done
}

function showYaml() {
    python -c 'import yaml,pprint;pprint.pprint(yaml.load(open("$1").read(), Loader=yaml.FullLoader))'
}

function socksy() {
    readonly CMND=${1:-status}
    readonly HOST=${2:-socks_proxy}

    case $CMND in
    up)
        ssh -f -N -T -M -D 1366 $HOST
        ;;
    down)
        ssh -T -O "exit" $HOST
        ;;
    status)
        msg=$(ssh -T -O "check" $HOST >&1)
        ret=$?
        if [[ $ret -eq 0 ]]
        then
        echo -n "${msg}"
        else
        echo "tunnel is down"
        fi
        ;;
    esac
}