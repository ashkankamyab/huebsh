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

function swappy(){
    $sudo_cmd find /proc -maxdepth 2 -path "/proc/[0-9]*/status" -readable -exec awk -v FS=":" '{process[$1]=$2;sub(/^[ \t]+/,"",process[$1]);} END {if(process["VmSwap"] && process["VmSwap"] != "0 kB") printf "%10s %-30s %20s\n",process["Pid"],process["Name"],process["VmSwap"]}' '{}' \; | awk '{print $(NF-1),$0}' | sort -hr | head | cut -d " " -f2-
}

function yamlpy() {
    python -c 'import sys,yaml,pprint;pprint.pprint(yaml.load(open(sys.argv[1]).read(), Loader=yaml.FullLoader))' $1
}

function open() {
    readonly OPENPATH=${1:-$(pwd)}
    nautilus $OPENPATH > /dev/null 2>&1
}

# IPv4 v6 aliases may work as a Function
function iphazip(){
    readonly IPTYPE=${1:-both}
    readonly IPVERSION=${2:-v4}

    echo "$IPVERSION: \n"
    case $IPTYPE in
    public)
        curl icanhazip.com
        ;;
    private)
        ip addr show $(ip route | grep default | awk '{print $5}' | head -n1) | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}?\/.{1,2}"
        ;;
    both)
        echo  -ne "Public IP:  "; curl icanhazip.com
        echo -ne "Private IP: ";  ip addr show $(ip route | grep default | awk '{print $5}' | head -n1) | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}?\/.{1,2}"
    esac

    #TODO:
    echo "\n v6 is coming"
}


#TODO: Find a solution for create a sshconfig
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

