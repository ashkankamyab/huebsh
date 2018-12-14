#/bin/bash
KNOWN_DISTRIBUTION="(Debian|Ubuntu|RedHat|CentOS|openSUSE|Amazon|Arista|SUSE)"
DISTRIBUTION=$(lsb_release -d 2>/dev/null | grep -Eo $KNOWN_DISTRIBUTION  || grep -Eo $KNOWN_DISTRIBUTION /etc/issue 2>/dev/null || grep pa-Eo $KNOWN_DISTRIBUTION /etc/Eos-release 2>/dev/null || grep -m1 -Eo $KNOWN_DISTRIBUTION /etc/os-release 2>/dev/null || uname -s)


if [ $DISTRIBUTION = "Darwin" ]; then
    printf "\033[31mThis script does not support installing on the Mac.
Please wait for Darwin version\033[0m\n"
    exit 1;

elif [ -f /etc/debian_version -o "$DISTRIBUTION" == "Debian" -o "$DISTRIBUTION" == "Ubuntu" ]; then
    OS="Debian"
    echo $OS
elif [ -f /etc/redhat-release -o "$DISTRIBUTION" == "RedHat" -o "$DISTRIBUTION" == "CentOS" -o "$DISTRIBUTION" == "Amazon" ]; then
    OS="RedHat"
    echo $OS
# Some newer distros like Amazon may not have a redhat-release file
elif [ -f /etc/system-release -o "$DISTRIBUTION" == "Amazon" ]; then
    OS="RedHat"
    echo $OS
# Arista is based off of Fedora14/18 but do not have /etc/redhat-release
elif [ -f /etc/Eos-release -o "$DISTRIBUTION" == "Arista" ]; then
    OS="RedHat"
    echo $OS
# openSUSE and SUSE use /etc/SuSE-release or /etc/os-release
elif [ -f /etc/SuSE-release -o "$DISTRIBUTION" == "SUSE" -o "$DISTRIBUTION" == "openSUSE" ]; then
    OS="SUSE"
    echo $OS
fi

# Root user detection
if [ $(echo "$UID") = "0" ]; then
    sudo_cmd=''
else
    sudo_cmd='sudo'
fi

if [ "$OS" == "RedHat" ]; then
    $sudo_cmd yum -y install epel-release
    $sudo_cmd yum -y update && $sudo_cmd yum -y install $(cat Packages.txt)

elif [ "$OS" == "Debian" ]; then
    $sudo_cmd apt update && $sudo_cmd apt install -y $(cat Packages.txt)
elif [ "$OX" == "SUSE"]; then
    $sudo_cmd zypper refresh -y && $sudo_cmd zypper update -y && sudo_cmd zypper install $(cat Packages.txt)
fi
# $sudo_cmd sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
