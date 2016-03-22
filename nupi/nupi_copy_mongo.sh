#!/bin/bash

set -e

MONGO_HOST=172.17.0.1
DUMP=copy_mongo
FROM=$1
TO=$2

mkdir $DUMP
mongodump -h $MONGO_HOST -d $FROM -o $DUMP --excludeCollectionsWithPrefix=rawRequest
mongorestore -h $MONGO_HOST -d $TO $DUMP/$FROM
rm -rf $DUMP
