#!/bin/bash
image_name="${1/docker-/}"
image_tag=${2:-ubuntu}
sudo docker build --rm -t leeonky/$image_name:$image_tag "$1"
