#!/bin/bash

set -e

MONGO_HOST=172.17.0.1
DUMP=copy_to_prod
NAME=nupi_n7h

mkdir $DUMP
mongodump -h $MONGO_HOST -d $NAME -o $DUMP
./upload_nupi_dump.sh dev $DUMP/$NAME
rm -rf $DUMP
