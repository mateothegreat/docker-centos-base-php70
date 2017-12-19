# docker-centos-base-php70

Centos 7 & PHP7.0 (from remi). Ready for nginx container [mateothegreat/docker-centos-base-nginx](https://github.com/mateothegreat/docker-centos-base-nginx) using fastcgi (php-fpm).

To begin, clone this repo:
```
git clone https://github.com/mateothegreat/docker-centos-base-php70
```

# Running
Replace '.' for the --volume switch if you do not want to mount in-place the current working directory.
To start a container instance:
```
make run
```
which is the same as:
```
docker run  -d                      \
            --rm                    \
            --volume .:/www         \
            --name nginx-php70      \
            appsoa/docker-centos-base-php70:latest
```

# Building

Update Dockerfile to your liking and run:

```
make build
```

## PHP Modules

```bash

RUN rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum install -y  php70-php \
                    php70-php-bcmath \
                    php70-php-cli \
                    php70-php-common \
                    php70-php-devel \
                    php70-php-fpm \
                    php70-php-gd \
                    php70-php-gmp \
                    php70-php-intl \
                    php70-php-json \
                    php70-php-mbstring \
                    php70-php-mcrypt \
                    php70-php-mysqlnd \
                    php70-php-opcache \
                    php70-php-pdo \
                    php70-php-pear \
                    php70-php-process \
                    php70-php-pspell \
                    php70-php-xml \
                    php70-php-pecl-imagick \
                    php70-php-pecl-mysql \
                    php70-php-pecl-uploadprogress \
                    php70-php-pecl-uuid \
                    php70-php-pecl-zip 
```
