#/bin/bash
KNOWN_DISTRIBUTION="(Debian|Ubuntu|RedHat|CentOS|openSUSE|Amazon|Arista|SUSE)"
DISTRIBUTION=$(lsb_release -d 2>/dev/null | grep -Eo $KNOWN_DISTRIBUTION  || grep -Eo $KNOWN_DISTRIBUTION /etc/issue 2>/dev/null || grep pa-Eo $KNOWN_DISTRIBUTION /etc/Eos-release 2>/dev/null || grep -m1 -Eo $KNOWN_DISTRIBUTION /etc/os-release 2>/dev/null || uname -s)
USER=$(whoami)


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
    $sudo_cmd yum -y update && $sudo_cmd yum -y install $(cat ./packages/debian)

elif [ "$OS" == "Debian" ]; then
    $sudo_cmd apt update -qqq > /dev/null && $sudo_cmd apt install -qqy > /dev/null $(cat Packages.txt)


elif [ "$OX" == "SUSE"]; then
    $sudo_cmd zypper refresh -y && $sudo_cmd zypper update -y && sudo_cmd zypper install $(cat Packages.txt)
fi
# $sudo_cmd sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


## Install Docker and Docker Compose and Minikube
curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
$sudo_cmd sh /tmp/get-docker.sh
$sudo_cmd usermod -aG docker $USER
$sudo_cmd curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)"\
    -o /usr/local/bin/docker-compose
$sudo_cmd chmod +x /usr/local/bin/docker-compose
$sudo_cmd curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
    -o minikube-linux-amd64 && $sudo_cmd install minikube-linux-amd64 /usr/local/bin/minikube \
    && rm -f minikube-linux-amd64

$sudo_cmd snap install code --classic
$sudo_cmd snap install skype --classic
$sudo_cmd snap install spotify
$sudo_cmd snap install slack --classic

# Install pip and virtualenv
curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
python3 /tmp/get-pip.py
pip install virtualenv
pip install speedtest-cli
pip install youtube-dl
pip install glances

## Huebsh installtion
source src/huebsh_shell.sh; echo "==== Huebsh sourced ===="
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim > /dev/null; echo "==== Vundle cloned ===="
cp src/.bash_aliases src/.bash_functions src/.bashrc src/.vimrc ~ ; echo "==== Dot files coppied ===="
echo "==== installing Huebsh_tmux ===="; huebsh_tmux
sleep 3
echo "==== installing Huebsh_shell ===="; huebsh_shell
echo " Done !!!"; sleep 3 && clear
echo " Done !!! Congratz "; sleep 1 && clear
echo " Done !!! Congratz "; sleep 1 && clear
cowsay "Very Well Done"