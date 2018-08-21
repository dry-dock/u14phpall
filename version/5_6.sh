#!/bin/bash -e

PHP5_6_VERSION="5.6.37"
echo "============ Building PHP5_6_VERSION =============="
PHP_BUILD_CONFIGURE_OPTS="--with-bz2 --enable-intl" php-build -i development "$PHP5_6_VERSION" $HOME/.phpenv/versions/5.6

# Setting phpenv to PHP5.6_VERSION
echo "============ Setting phpenv to 5.6 ============"
phpenv rehash
phpenv global 5.6

# Install phpunit
PHPUNIT_VERSION="5.7.27"
echo "============ Installing PHPUnit ============="
wget -nv https://phar.phpunit.de/phpunit-"$PHPUNIT_VERSION".phar
chmod +x phpunit-"$PHPUNIT_VERSION".phar
mv phpunit-"$PHPUNIT_VERSION".phar $HOME/.phpenv/versions/5.6/bin/phpunit

# Install Composer
echo "============ Installing Composer ============"
curl -sS http://getcomposer.org/installer | php
chmod +x composer.phar
mv composer.phar $HOME/.phpenv/versions/5.6/bin/composer

sudo apt-get install php5.6-ldap
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
