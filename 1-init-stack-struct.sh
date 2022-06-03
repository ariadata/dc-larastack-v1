#!/bin/bash
cd "$(dirname "$0")"

mkdir -p ./data/pgsql

# create a .env file from example of stack
[ ! -f .env ] && cp .env.example .env

# make copy of lravel's .env file in src direcotry
if [ ! -f /src/.env ]; then
	cp ./src/.env.example ./src/.env
fi

# find UID/GID and write in .env file
sed -i "s|UID=.*|UID=$(id -u)|g" .env
sed -i "s|GID=.*|GID=$(id -g)|g" .env

docker-compose pull

docker-compose up -d

docker-compose exec -T workspace php artisan key:generate

docker-compose exec -T workspace composer install -q --no-ansi --no-interaction --no-scripts --no-progress --prefer-dist

# php artisan config:cache
# php artisan storage:link
# php artisan route:cache
# php artisan view:cache
# php artisan horizon:terminate
# php artisan config:cache && php artisan route:cache && php artisan view:cache && php artisan horizon:terminate

# echo 'export DOCKER_USER="$(id -u):$(id -g)"' >> ~/.bash_profile
# source ~/.bash_profile

# docker-compose exec -T workspace php artisan migrate:fresh --force




