## Git Functions

function git-commit-all(){
    if [ $1 ]; then
        git commit -m "$1"
    else
        git commit --allow-empty-messag
    fi
}


# https://www.ibm.com/developerworks/community/blogs/ac33fe4b-e8f6-48d6-8a93-2d4f63b264ed/entry/handy_bash_functions_history_grep?lang=en
function hgrep () {
    history | grep ${*:1}
}

# SASS by stefan.klinkusch@googlemail.com
function sassy {
  node-sass --watch --recursive --source-map-contents "$1" --output "$2 --source-map true"
}


# Attaching socks connection,
# TODO: But how detachting it?
# usage socksy username@hotst:RemotePort LocalPort
function socksy () {
    ssh -D $2 $1 -N >/dev/null 2>&1 &
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
    red='\033[1;31m'
    gray='\033[1;36m'
    if [ -z $1 ]; then
        echo "$gray Private v4:  $red$(ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | sed -n 2p)"
        echo "$gray Public  v4:  $red$(curl -s www.icanhazip.com)"
        printf "%`tput cols`s"|sed "s/ /-/g"
        echo "$gray Private v6:  $red$(ip add sh | grep -oP '(?<=inet6\s).{1,4}:+(:.{1,4}){4}' | sed -n 1p)"
        #echo "$gray Public v6:  $red$(curl -s www.icanhazip6.com)
    else
        if [ $1 -ne 4 -a $1 -ne 6 ]; then
            echo "$red Error! $gray: Wrong Argument"
            echo " $1 is not supported, please check the usage"
            echo " Usage: myIps 6 or myIps 4"
        else
            if [ $1 -eq 4 ]; then
                echo "$gray Private:  $red$(ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | sed -n 2p)"
                echo "$gray Public:   $red$(curl -s www.icanhazip.com)"
            else
                echo "$gray Private:  $red$(ip add sh | grep -oP '(?<=inet6\s).{1,4}:+(:.{1,4}){4}' | sed -n 1p)"
                #echo "$gray Public:   $red$(curl -s www.icanhazip6.com)"
            fi
        fi
    fi
}


#TODO: lets create a function for wirless activity from command line:
# iwlist wlp2s0 scan
# iwconfig wlp2s0 essid "$SSID" key s:$pass
# iw
