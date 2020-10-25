#!/bin/bash

function huebsh_shell() {
    read -p "Do you like to install Ohmyzsh as your default shell? <y/N> " ohmyzsh_prompt
    if [[ $ohmyzsh_prompt =~ [yY](es)* ]]
    then
        echo "You need a sudo root"
        echo -n "Installing ohmyzsh! "; sleep 0.5
        for i in {1..3}; do echo -n ".";done
        echo ""
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        sleep 5
        cp ~/.zshrc ~/.zshrc_original; echo "old .zshrc backed up in ~/.zshrc_original"
        cp .zshrc ~/.zshrc
        cp .zsh_theme ~/.zsh_theme
        
    elif [[ $ohmyzsh_prompt =~ [nN](es)* ]]
    then
        echo -n "BASH!!!"; sleep 0.5
        for i in {1..3}; do echo -n ".";done
        echo -n "\n"
        cp .bash_gitpromt ~
    else
        echo "ERROR"
        return 1
    fi
}

function huebsh_tmux() {
    read -p "Do you like us to touch your tmux config? <y/N> " ohmytumux_prompt
    if [[ $ohmyzsh_prompt =~ [yY](es)* ]]
    then
        echo -n "Nice decision you've made "
        for i in {1..3}; do echo -n ".";done
        echo -n "\n"
        cp .tmux.conf .tmux.conf.local ~
    else
        echo -n "Fine, enjoy hacking !!!"
        return 1
}

