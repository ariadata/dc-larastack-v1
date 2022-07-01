# dc-larastack v1
[![Build Status](https://files.ariadata.co/file/ariadata_logo.png)](https://ariadata.co)

![](https://img.shields.io/github/stars/ariadata/dc-larastack-v1.svg)
![](https://img.shields.io/github/watchers/ariadata/dc-larastack-v1.svg)
![](https://img.shields.io/github/forks/ariadata/dc-larastack-v1.svg)

### This Stack needs : 

* for `Local` : [dockerhost](https://github.com/ariadata/ubuntu-sh)

* for `Production` : [dockerhost](https://github.com/ariadata/ubuntu-sh) + [Nginx-Proxy-Manager](https://github.com/ariadata/dc-nginxproxymanager)

---
## 🧪 **Local**
### Install and initialize
```bash
git clone https://github.com/ariadata/dc-larastack-v1.git dc-larastack-v1 && cd dc-larastack-v1

sed -i "s|UID=.*|UID=$(id -u)|g" .env && sed -i "s|GID=.*|GID=$(id -g)|g" .env
sed -i "s|DC_TZ=.*|DC_TZ=\"$(cat /etc/timezone)\"|g" .env
sed -i "s|APP_TIMEZONE=.*|APP_TIMEZONE=\"$(cat /etc/timezone)\"|g" ./src/.env
sed -i "s|php_value\[date.timezone\] \=.*|php_value\[date.timezone\] \= $(cat /etc/timezone)|g" ./configs/php/fpm-php-override.ini