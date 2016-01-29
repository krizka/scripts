#!/bin/sh

if [ `uname` = 'Linux' ]; then
    apt-get update
    apt-get install -y git
    git clone https://github.com/krizka/scripts.git scripts
    
    cd ubuntu && ./setup.sh
fi
