#!/bin/bash -e

#Build PHP 5.6.30
echo "============ Building PHP 5.6.30 =============="
PHP_BUILD_CONFIGURE_OPTS="--with-bz2 --enable-intl" php-build -i development 5.6.30 $HOME/.phpenv/versions/5.6

# Setting phpenv to 5.6.30
echo "============ Setting phpenv to 5.6 ============"
phpenv rehash
phpenv global 5.6

# Install phpunit
echo "============ Installing PHPUnit ============="
wget -nv https://phar.phpunit.de/phpunit-5.7.phar
chmod +x phpunit-5.7.phar
mv phpunit-5.7.phar $HOME/.phpenv/versions/5.6/bin/phpunit

# Install Composer
echo "============ Installing Composer ============"
curl -sS http://getcomposer.org/installer | php
chmod +x composer.phar
mv composer.phar $HOME/.phpenv/versions/5.6/bin/composer

#install pickle
cd /tmp/pickle
$HOME/.phpenv/versions/5.6/bin/composer install

# Install php extensions
echo "=========== Installing PHP extensions =============="
printf '\n' | bin/pickle install memcache
printf '\n' | bin/pickle install memcached-2.2.0
printf '\n' | bin/pickle install mongo
printf '\n' | bin/pickle install amqp-1.6.0
printf '\n' | bin/pickle install zmq-beta
printf '\n' | bin/pickle install redis

cd /
