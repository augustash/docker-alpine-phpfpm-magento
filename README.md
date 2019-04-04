# Alpine PHP-FPM Magento Development Image

![https://www.augustash.com](http://augustash.s3.amazonaws.com/logos/ash-inline-color-500.png)

**This base container is not currently aimed at public consumption. It exists as a starting point for August Ash containers.**

## Versions

- `1.0.0`, `latest` [(Dockerfile)](https://github.com/augustash/docker-alpine-phpfpm-magento/blob/1.0.0/Dockerfile)

[See VERSIONS.md for image contents.](https://github.com/augustash/docker-alpine-phpfpm-magento/blob/master/VERSIONS.md)

## Usage

[See PHP-FPM for instructions.](https://github.com/augustash/docker-alpine-phpfpm/blob/master/README.md)

### Included Extensions

These PHP extensions are enabled:

- `bcmath`
- `dom`
- `ctype`
- `curl`
- `ftp`
- `gd`
- `iconv`
- `intl`
- `ioncube`
- `json`
- `mbstring`
- `mcrypt`
- `opcache`
- `openssl`
- `pdo`
- `pdo_mysql`
- `phar`
- `posix`
- `redis`
- `soap`
- `xdebug`
- `xml`
- `xsl`
- `zip`
- `zlib`

### Environment Variables

The following variables can be set and will change how the container behaves. You can use the `-e` flag, an environment file, or your Docker Compose file to set your preferred values. The default values are shown:

- `PUID`=501
- `PGID`=1000
- `DEBUG`=false
- `PHP_MEMORY_LIMIT`=1G

Variables used for installing & configuring Magento:

- `MAGENTO_ADMIN_EMAIL`=user@example.com
- `MAGENTO_ADMIN_FIRSTNAME`=August
- `MAGENTO_ADMIN_LASTNAME`=Ash
- `MAGENTO_ADMIN_PASSWORD`=Password1
- `MAGENTO_ADMIN_USER`=augustash
- `MAGENTO_BACKEND_FRONTNAME`=random-admin-url
- `MAGENTO_BASE_URL_SECURE`=true
- `MAGENTO_BASE_URL`=https://magento.test/
- `MAGENTO_CODEBASE`=open-source
- `MAGENTO_CURRENCY`=USD
- `MAGENTO_DB_HOST`=mysql
- `MAGENTO_DB_NAME`=magento2
- `MAGENTO_DB_PASSWORD`=password
- `MAGENTO_DB_USER`=user
- `MAGENTO_ELASTICSEARCH_HOST`=elasticsearch
- `MAGENTO_INSTALL_DB`=false
- `MAGENTO_INSTALL_STRING`=
- `MAGENTO_LANGUAGE`=en_US
- `MAGENTO_PATH`=/src
- `MAGENTO_PHPSTORM_META`=false
- `MAGENTO_RABBITMQ_HOST`=rabbitmq
- `MAGENTO_RABBITMQ_PASS`=magento
- `MAGENTO_RABBITMQ_PORT`=5672
- `MAGENTO_RABBITMQ_USER`=magento
- `MAGENTO_REDIS_CACHE_HOST`=redis-cache
- `MAGENTO_REDIS_SESSION_HOST`=redis-sessions
- `MAGENTO_REWRITES`=1
- `MAGENTO_TIMEZONE`=America/Chicago
- `MAGENTO_USE_SAMPLE_DATA`=false
- `MAGENTO_VERSION`=2.3.1

## Utilities

The following utilities are installed and available by default within this image. All scripts proxy to their official counterpart but run by the `ash` user instead of `root`.

### `/usr/local/bin/composer`

Runs [Composer](https://getcomposer.org/), the defacto dependency manager for PHP.

### `/usr/local/bin/grunt`

Runs [Grunt](https://gruntjs.com/), the JavaScript task runner.

### `/usr/local/bin/gulp`

Runs [Gulp](https://gulpjs.com/), which is an alternate JavaScript task runner.

### `/usr/local/bin/installer`

Custom script to install and configure a new Magento 2 instance. Requires the `MAGENTO_` environment variables defined above.

### `/usr/local/bin/magento`

A proxy to the `bin/magento` tool that comes with Magento 2.

### `/usr/local/bin/n98`

Runs [n98-magerun2](https://magerun.net/), the swiss army knife for Magento developers, sysadmins and devops.

## Sample Magento 2 Commands

When this image is used as part of a Magento 2 cluster, the following commands can be useful:

```bash
docker-compose run --rm alpine-phpfpm-magento magento deploy:mode:set developer
docker-compose run --rm alpine-phpfpm-magento magento setup:upgrade
docker-compose run --rm alpine-phpfpm-magento magento setup:di:compile
docker-compose run --rm alpine-phpfpm-magento magento setup:static-content:deploy
docker-compose run --rm alpine-phpfpm-magento magento cache:clean
```
