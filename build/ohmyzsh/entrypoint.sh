#!/bin/sh

if [ ! -e ~/.oh-my-zsh/oh-my-zsh.sh ]; then
    echo "oh-my-zsh.sh not found";
    if [ "${PROXY}" != "" ]; then 
        echo "Set Proxy: ${PROXY}";
        export http_proxy=${PROXY} && export https_proxy=${PROXY};
    fi

    git clone https://github.com/ohmyzsh/ohmyzsh.git /root/.oh-my-zsh
fi

# run Shell
zsh