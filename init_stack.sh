#!/bin/bash
cd "$(dirname "$0")"

mkdir -p ./data/pgsql

# create a .env file from example of stack
[ ! -f .env ] && cp .env.example .env

# make copy of lravel's .env file in src direcotry
if [ ! -f /src/.env ]; then
	cp ./src/.env.example ./src/.env
fi
