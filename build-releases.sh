#!/bin/bash -e

# Run examples:
#
# GOOS=linux ./build-releases.sh
# GOOS=darwin ./build-releases.sh
# ./build-releases.sh

[[ -d releases ]] || mkdir releases

goos=$GOOS
[[ -z "$goos" ]] && goos=$(go env GOOS)
GOOS=$goos go build -v .

cd releases
DIR=goconvey.$goos
[[ -d $DIR ]] && rm -rf $DIR
mkdir $DIR

mkdir -p $DIR/{bin,static/reports}

cp -rf ../web/client/* $DIR/static
mv ../goconvey $DIR/bin
cp ../wrapper.sh $DIR/bin

tar vcfz ${DIR}.tar.gz $DIR
