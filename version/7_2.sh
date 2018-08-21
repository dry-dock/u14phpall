#!/bin/bash -e

PHP7_2_VERSION="7.2.9"
echo "============ Building $PHP7.2_VERSION  =============="

PHP_BUILD_CONFIGURE_OPTS="--with-bz2 --enable-intl" php-build -i development "$PHP7_2_VERSION" $HOME/.phpenv/versions/7.2

# Setting phpenv to PHP7.2_VERSION
echo "============ Setting phpenv to 7.2 ============"
phpenv rehash
phpenv global 7.2

# Install phpunit
PHPUNIT_VERSION="7.3.0"
echo "============ Installing PHPUnit ============="
wget -nv https://phar.phpunit.de/phpunit-"$PHPUNIT_VERSION".phar
chmod +x phpunit-"$PHPUNIT_VERSION".phar
mv phpunit-"$PHPUNIT_VERSION".phar $HOME/.phpenv/versions/7.2/bin/phpunit

# Install Composer
echo "============ Installing Composer ============"
curl -sS http://getcomposer.org/installer | php
chmod +x composer.phar
mv composer.phar $HOME/.phpenv/versions/7.2/bin/composer

sudo apt-get install php7.2-ldap
#install pickle
cd /tmp/pickle
$HOME/.phpenv/versions/7.2/bin/composer install --no-dev

# Install php extensions
echo "=========== Installing PHP extensions =============="
printf '\n' | bin/pickle install memcached
printf '\n' | bin/pickle install amqp
printf '\n' | bin/pickle install zmq-beta
printf '\n' | bin/pickle install redis

echo "--with-openssl-dir=yes" >> /tmp/pickle-mongodb-opts
printf '\n' | bin/pickle install --with-configure-options=/tmp/pickle-mongodb-opts mongodb
rm /tmp/pickle-mongodb-opts

cd /



