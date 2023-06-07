#!/bin/env bash

# Select which theme will be installed
if [ "$1" = "safe" ]
then
    theme="elagoht-safe"
else
    theme="elagoht"
fi

# Download the theme
curl \
    -sfSL https://raw.githubusercontent.com/Elagoht/Elagoht.zsh-theme/main/$theme.zsh-theme \
    -o ~/.oh-my-zsh/themes/$theme.zsh-theme

# Activate the theme
sed -i "s/^ZSH_THEME=.*/ZSH_THEME='$theme'/" ~/.zshrc

if [[ ! "$(grep '^plugins' ~/.zshrc)" =~ "virtualenv" ]] # If not already added
then # add the virtualenv plugin
    sed -i 's/^plugins=(/plugins=(virtualenv /' ~/.zshrc
fi
