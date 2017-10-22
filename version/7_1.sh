#!/bin/bash -e

#Build PHP 7.1.9
echo "============ Building PHP 7.1.9 =============="
PHP_BUILD_CONFIGURE_OPTS="--with-bz2 --enable-intl" php-build -i development 7.1.9 $HOME/.phpenv/versions/7.1

# Setting phpenv to 7.1.9
echo "============ Setting phpenv to 7.1 ============"
phpenv rehash
phpenv global 7.1

# Install phpunit
echo "============ Installing PHPUnit ============="
wget -nv https://phar.phpunit.de/phpunit-5.7.phar
chmod +x phpunit-5.7.phar
mv phpunit-5.7.phar $HOME/.phpenv/versions/7.1/bin/phpunit

# Install Composer
echo "============ Installing Composer ============"
curl -sS http://getcomposer.org/installer | php
chmod +x composer.phar
mv composer.phar $HOME/.phpenv/versions/7.1/bin/composer

#install pickle
cd /tmp/pickle
$HOME/.phpenv/versions/7.1/bin/composer install

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


