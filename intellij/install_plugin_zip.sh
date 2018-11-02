#!/bin/bash
set -x
cd "$IDEA_PATH/plugins"

curl -o tmp.zip "$1"
unzip tmp.zip
rm -f tmp.zip

cd -
