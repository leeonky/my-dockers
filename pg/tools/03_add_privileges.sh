#!/bin/sh
db=${1:-gene_dev}
user=${2:-gene_dev}
psql -c "GRANT ALL PRIVILEGES ON DATABASE $db to $user"
