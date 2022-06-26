#!/bin/bash
set -x

curl -o tmp.zip "$1"
unzip tmp.zip
rm -f tmp.zip

cd -

