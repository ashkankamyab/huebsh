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
    echo "$gray Private:  $red$(ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | sed -n 2p)"
    echo "$gray Public:   $red$(curl -s www.icanhazip.com)"
}
