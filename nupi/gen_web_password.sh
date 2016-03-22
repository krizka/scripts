#!/bin/bash

set -e

if [ "$1" = "n7h" -o "$1" = "dev" -a ! -z "$2" ]; then
	NAME=~nupi/htpasswd_$1
	USER=$2
	PASSWD=$3
else
	echo "usage (n7h|dev) name" && exit 1
fi

if [ -z "$PASSWD" ]; then
	PASSWD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
fi
HASH=$(openssl passwd $PASSWD)

grep -v "$USER:" $NAME > $NAME.tmp
echo "$USER:$HASH" >> $NAME.tmp
mv $NAME.tmp $NAME 

echo "$USER / $PASSWD"
