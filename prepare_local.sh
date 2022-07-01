#!/bin/bash
clear
cd "$(dirname "$0")"

git clone https://github.com/ariadata/dc-larastack-laravel9-v1.git src
clear

system_default_timezone="$(cat /etc/timezone)"
STACK_UID="$(id -u)"
STACK_GID="$(id -g)"

read -e -p $'Enter \e[33mStack-Name\033[0m (no spaces!):\n' -i "larastack" DC_COMPOSE_PROJECT_NAME

read -e -p $'Enter \e[33mdefault timezone\033[0m for stack :\n' -i $system_default_timezone STACK_DEFAULT_TZ

read -e -p $'Enter \e[33mnginx http port\033[0m for stack :\n' -i "8051" STACK_NGINX_HTTP_PORT

read -e -p $'Enter \e[33mPHPMyAdmin http port\033[0m for stack :\n' -i "8082" STACK_PHPMYADMIN_HTTP_PORT

mkdir -p ./data/{mongo,mysql,pgsql,redis}
cp .env.example .env
cp ./src/.env.example ./src/.env

# set compose_project_name .env
sudo sed -i "s|COMPOSE_PROJECT_NAME=.*|COMPOSE_PROJECT_NAME=$DC_COMPOSE_PROJECT_NAME|g" .env

# set UID/GID to .env
sudo sed -i "s|UID=.*|UID=$STACK_UID|g" .env && sed -i "s|GID=.*|GID=$STACK_GID|g" .env

# set Default time zone in .env and /src/.env and php_overrides
sudo sed -i "s|DC_TZ=.*|DC_TZ=\"$STACK_DEFAULT_TZ\"|g" .env
sudo sed -i "s|APP_TIMEZONE=.*|APP_TIMEZONE=\"$STACK_DEFAULT_TZ\"|g" ./src/.env
sudo sed -i "s|php_value\[date.timezone\] \=.*|php_value\[date.timezone\] \= $STACK_DEFAULT_TZ|g" ./configs/php/fpm-php-override.ini

# set http port for nginx and phpmyadmin
sudo sed -i "s|DC_PHPMYADMIN_HTTP_PORT=.*|DC_PHPMYADMIN_HTTP_PORT=$STACK_NGINX_HTTP_PORT|g" .env
sudo sed -i "s|DC_NGINX_HTTP_PORT=.*|DC_NGINX_HTTP_PORT=$STACK_PHPMYADMIN_HTTP_PORT|g" .env

cp local.yml docker-compose.yml

docker-compose pull
docker-compose up -d

docker-compose exec -u webuser -T workspace composer update
docker-compose exec -u webuser -T workspace php artisan key:generate
sleep 5
docker-compose exec -u webuser -T workspace php artisan migrate:fresh --force
docker-compose exec -u webuser -T workspace ./vendor/bin/pint

docker-compose exec -u webuser -T supervisor supervisorctl restart all

# clear
echo $'\e[32mLocal Stack is Ready\033[0m\n========================================\n'
echo -e "Web : http://localhost:$STACK_NGINX_HTTP_PORT\n"
echo -e "PMA : http://localhost:$STACK_PHPMYADMIN_HTTP_PORT\n"


