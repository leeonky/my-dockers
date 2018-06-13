#!/bin/sh
file=${1}
db=${2:-gene_dev}
user=${3:-gene_dev}
PGPASSWORD=${4:-gene_dev}
pg_restore -c -i -U $user -d $db -v "$1"
