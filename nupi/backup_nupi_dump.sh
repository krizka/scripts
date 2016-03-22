#!/bin/bash

set -e

if [ ! -z "$1" -a -d "$2" ]; then
	NAME=nupi_$1
	DUMP=$2
else
	echo "usage (n7h|dev|demo) backup_path" && exit 1
fi

MONGO_HOST=172.17.0.1
DATE=`date +%Y.%m.%d-%H.%M.%S`

mongodump -h $MONGO_HOST -d $NAME -o $DUMP --excludeCollectionsWithPrefix=rawRequest --excludeCollectionsWithPrefix=aggregation_ --excludeCollectionsWithPrefix=log

pushd $DUMP
tar zcf $NAME-$DATE.tgz $NAME
rm -rf $NAME
popd
