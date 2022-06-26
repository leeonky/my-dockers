#!/bin/bash
image_name="${1/docker-/}"
image_tag=${2:-ubuntu}
sudo docker build --rm -t leeonky/$image_name:$image_tag "$1" --build-arg SECRET_RSA="$(cat ~/.ssh/id_rsa)" --build-arg SECRET_HOST="$(cat ~/.ssh/known_hosts)"
#--build-arg https_proxy='192.168.1.108:8123'
#--build-arg curl_proxy='--socks5-hostname 192.168.1.108:10800'

