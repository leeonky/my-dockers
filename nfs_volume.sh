#!/bin/bash
set -x
if [ "$1" == create ]; then
	sudo docker volume create --driver local \
		--opt type=nfs \
		--opt o=addr=192.168.1.103,rw \
		--opt device=:/share \
		share_nfs
else
	sudo docker volume rm share_nfs
fi

