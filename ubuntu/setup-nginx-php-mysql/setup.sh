#!/bin/bash

# curl https://raw.githubusercontent.com/krizka/scripts/master/get.sh | /bin/bash

set -e

INSTALL_PACKAGES="tmux mc nginx php5-fpm mysql-server"

# setup firewall

ufw enable
ufw allow ssh # 22
ufw allow http # 80

# setup some software 
apt-get update
apt-get install $INSTALL_PACKAGES


# start tmux on connect

echo -e "\ntmux attach || tmux" >> ~/.profile
 
