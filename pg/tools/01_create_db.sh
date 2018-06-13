#!/bin/sh
db=${1:-gene_dev}
psql -c "create database $db"
