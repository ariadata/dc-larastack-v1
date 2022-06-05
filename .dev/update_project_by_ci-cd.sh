#!/bin/bash
cd "$(dirname "$0")"
git reset --hard
git pull
git clean -f -d
git checkout $1
# php artisan down
cd ../
# docker-compose exec -T php php artisan down
# composer update
docker-compose exec -T php composer update -q --no-ansi --no-interaction
# docker-compose exec php composer update -q --no-ansi --no-interaction --no-scripts --no-progress --prefer-dist

# todo: cache functions

# php artisan migrate
docker-compose exec -T php php artisan config:clear
docker-compose exec -T php php artisan migrate --force
# php artisan up
# docker-compose exec -T php php artisan up
