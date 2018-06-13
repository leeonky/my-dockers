#!/bin/sh
user=${1:-gene_dev}
pwd=${2:-gene_dev}
psql -c "CREATE USER $user WITH PASSWORD '$pwd'"
