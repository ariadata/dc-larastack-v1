# dc-larastack v1
[![Build Status](https://files.ariadata.co/file/ariadata_logo.png)](https://ariadata.co)

![](https://img.shields.io/github/stars/ariadata/dc-larastack-v1.svg)
![](https://img.shields.io/github/watchers/ariadata/dc-larastack-v1.svg)
![](https://img.shields.io/github/forks/ariadata/dc-larastack-v1.svg)

### Laravel Stack for local and production , includes:
* workspace
  * nginx
  * php-fpm
* supervisor (schedule , queue ,short-schedule , ...)
* MariaDb
* PHPMyAdmin
* PostgreSQL
* MongoDb
* Redis
* npm
* zabbix-agent


### This needs :

* 🧪 for **Local** : [docker + docker-compose](https://github.com/ariadata/ubuntu-sh)

* 🌐 for **Production** : [docker + docker-compose](https://github.com/ariadata/ubuntu-sh) + [Nginx-Proxy-Manager](https://github.com/ariadata/dc-nginxproxymanager)

---
# 🧪 Local usage
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
##### other commands :
`php artisan test`

---
# 🌐 Production use
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
