#!/bin/bash -e

PHP7_3_VERSION="7.3.1"
PHPENV_VERSION="7.3"
echo "============ Building "$PHP7_3_VERSION" =============="
PHP_BUILD_CONFIGURE_OPTS="--with-bz2 --enable-intl --with-ldap=/usr/include" php-build -i development "$PHP7_3_VERSION" $HOME/.phpenv/versions/"$PHPENV_VERSION_ALIAS"

# Setting phpenv to "$PHPENV_VERSION_ALIAS"
echo "============ Setting phpenv to "$PHPENV_VERSION_ALIAS" ============"
phpenv rehash
phpenv global "$PHPENV_VERSION_ALIAS"

# Install phpunit
PHPUNIT_VERSION="7.5.1"
echo "============ Installing PHPUnit ============="
wget -nv https://phar.phpunit.de/phpunit-"$PHPUNIT_VERSION".phar
chmod +x phpunit-"$PHPUNIT_VERSION".phar
mv phpunit-"$PHPUNIT_VERSION".phar $HOME/.phpenv/versions/"$PHPENV_VERSION_ALIAS"/bin/phpunit

# Install Composer
echo "============ Installing Composer ============"
curl -sS http://getcomposer.org/installer | php
chmod +x composer.phar
mv composer.phar $HOME/.phpenv/versions/"$PHPENV_VERSION_ALIAS"/bin/composer

#install pickle
cd /tmp/pickle
$HOME/.phpenv/versions/"$PHPENV_VERSION_ALIAS"/bin/composer install --no-dev

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
