#
# Base nginx+php70 stack for phpmyadmin, wordpress & so on.
# Away with your EOL'ed requirements!
#
# Borrowed & pruned from https://github.com/million12/docker-nginx-php.
#
FROM appsoa/docker-centos-base-nginx
LABEL maintainer    = "Matthew Davis <matthew@appsoa.io>"
LABEL repository    = appsoa
LABEL image         = docker-centos-base-php70
LABEL built_at      = 0000-00-00 00:00:00

RUN rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum install -y  php70-php \
                    php70-php-bcmath \
                    php70-php-cli \
                    php70-php-common \
                    php70-php-devel \
                    php70-php-fpm 
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

RUN ln -sfF /opt/remi/php70/enable /etc/profile.d/php70-paths.sh && \
    ln -sfF /opt/remi/php70/root/usr/bin/{pear,pecl,phar,php,php-cgi,php-config,phpize} /usr/local/bin/. && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \  
    chown user:wheel /usr/local/bin/composer && composer --version 
    
COPY /entrypoint.sh /
COPY /entrypoint.d/* /entrypoint.d/
ONBUILD COPY /entrypoint.d/* /entrypoint.d/