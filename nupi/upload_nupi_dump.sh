#!/bin/bash

if [ "$1" = "n7h" -o "$1" = "dev" -a -d "$2" ]; then
	NAME=nupi_$1
	DUMP=$2
else
	echo "usage (n7h|dev) dump_path" && exit 1
fi

MONGO_HOST=172.17.0.1

mongo $MONGO_HOST/$NAME --eval "db.dropDatabase()"
docker restart $NAME
mongorestore -h $MONGO_HOST -d $NAME $DUMP
