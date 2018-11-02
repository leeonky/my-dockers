#!/bin/bash
image_name="${1/docker-/}"
image_tag=${2:-ubuntu}
sudo docker build --rm --add-host=pkg_host:$DEV_HOST -t leeonky/$image_name:$image_tag "$1" --build-arg SECRET_RSA="$(cat ~/.ssh/id_rsa)" --build-arg SECRET_HOST="$(cat ~/.ssh/known_hosts)"

