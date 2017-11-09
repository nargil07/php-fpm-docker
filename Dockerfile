FROM ubuntu

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    php7.0-fpm \
    php7.0-mcrypt \
    php7.0-mysql \
    php7.0-curl \
    php7.0-intl \
    php7.0-xml \
    php7.0-zip

COPY config/php-fpm.conf /etc/php/7.0/fpm/php-fpm.conf
COPY config/www.conf /etc/php/7.0/fpm/pool.d/www.conf
COPY config/php7.0-fpm.pid /run/php/php7.0-fpm.pid

EXPOSE 9000

CMD php-fpm7.0 -F
