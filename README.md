# dc-larastack v1
[![Build Status](https://files.ariadata.co/file/ariadata_logo.png)](https://ariadata.co)

![](https://img.shields.io/github/stars/ariadata/dc-larastack-v1.svg)
![](https://img.shields.io/github/watchers/ariadata/dc-larastack-v1.svg)
![](https://img.shields.io/github/forks/ariadata/dc-larastack-v1.svg)

### Laravel Stack for local and production , includes:
* workspace based on [s6-overlay](https://github.com/just-containers/s6-overlay)
  * nginx
  * php-8.1(fpm)
* supervisor (schedule , queue ,short-schedule , horizon , ...)
* MariaDb
* PHPMyAdmin
* PostgreSQL
* MongoDb
* Redis
* npm
* zabbix-agent
* fresh [laravel 9.x](https://laravel.com/docs/9.x) from [this github repo](https://github.com/ariadata/dc-larastack-laravel9-v1) configured for this stack

### This needs :

* 🧪 for **Local** : [docker + docker-compose](https://github.com/ariadata/ubuntu-sh)

* 🌐 for **Production** : [docker + docker-compose](https://github.com/ariadata/ubuntu-sh) + [Nginx-Proxy-Manager](https://github.com/ariadata/dc-nginxproxymanager)

---
# 🧪 Local usage
### 1️⃣ Install and initialize
```bash
git clone https://github.com/ariadata/dc-larastack-v1.git dc-larastack-v1 && cd dc-larastack-v1
bash prepare_local.sh

docker-compose exec -u webuser -T workspace composer update
docker-compose exec -u webuser -T workspace php artisan key:generate
docker-compose exec -u webuser -T workspace php artisan migrate:fresh --force
docker-compose exec -u webuser -T workspace ./vendor/bin/pint
docker-compose exec -u webuser -T supervisor supervisorctl restart all
```
### 2️⃣ Config bash_liases
Copy these lines into `.bash_aliases` of your system :
```bash
alias larastack='docker-compose exec -u webuser workspace'
alias larastack-supervisor='docker-compose exec -u webuser supervisor supervisorctl'
```
### ☑️ Usage Commands
##### artisan commands :
```bash
# php artisan test
larastack php artisan test

# composer install XXX
larastack composer install XXX

# restart short-schedule and shcedule
larastack-supervisor restart restart laravel-schedule laravel-short-schedule

# pint/clean code
larastack ./vendor/bin/pint

# system down/up
docker-compose down
docker-compose up -d

# npm build commands :
docker-compose run --rm npm install
docker-compose run --rm npm run dev
docker-compose run --rm npm run prod

```
##### other commands :
`php artisan test`

---
# 🌐 Production usage
### 1️⃣ Install and initialize
```bash
git clone https://github.com/ariadata/dc-larastack-v1.git dc-larastack-v1
cd dc-larastack-v1
bash prepare_local.sh
```
### 2️⃣ Config bash_liases
Copy these lines into `.bash_aliases` of your system :
```bash
alias sample='test'
alias sample='test'
```
### ☑️ Usage Commands
##### artisan commands :
```bash
php artisan test
```
### ♾️ CD/CD useful commands
sample text :
```bash
php artisan test
```
---
## 🔗 Resources & Links
* [sample](https://sample.com) #description
