# docker-centos-base-php70

<img style="height: 120px;" src="http://www.xtremeinfinity.com/wp-content/uploads/2015/12/PHP-7.png">
<img style="float: right;  padding-right: 20px; width: 200px;" src="http://i.imgur.com/rAuZnDH.png">

<span style="width: 300px; float: left">
Centos 7 & PHP7.0 (from remi). Ready for nginx container [mateothegreat/docker-centos-base-nginx](https://github.com/mateothegreat/docker-centos-base-nginx) using fastcgi (php-fpm).
</span>


<br style="clear: both">
#### PHP Modules

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
