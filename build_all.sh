#!/bin/bash
set -e
if ! sudo docker images | grep leeonky/os-base; then
	./build.sh os-base
fi
if ! sudo docker images | grep leeonky/os-dev; then
	./build.sh os-dev
fi
if ! sudo docker images | grep leeonky/vim; then
	./build.sh vim
fi
if ! sudo docker images | grep leeonky/rvm; then
	./build.sh rvm
fi
if ! sudo docker images | grep leeonky/rails-dev; then
	./build.sh rails-dev
fi
if ! sudo docker images | grep leeonky/pg; then
	./build.sh pg
fi

