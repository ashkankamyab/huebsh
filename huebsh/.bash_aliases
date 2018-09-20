# Root user detection
if [ $(echo "$UID") = "0" ]; then
    sudo_cmd=''
else
    sudo_cmd='sudo'
fi


alias ll='ls -la'
alias cls='clear'
alias rm='rm -I'
alias nowrooz=' $sudo_cmd apt-get update &&  $sudo_cmd apt-get upgrade'
alias behrooz=' $sudo_cmd apt-get autoclean &&  $sudo_cmd apt-get autoremove'
alias nowbeh='nowrooz && behrooz'
