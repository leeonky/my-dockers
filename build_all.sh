#!/bin/bash
set -e
./build.sh os-base
./build.sh os-dev
./build.sh os-vim
./build.sh rvm
./build.sh rails-dev
./build.sh pg

