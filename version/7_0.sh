#!/bin/bash -e

#Build PHP 7.0.1
echo "============ Building PHP 7.0 =============="
php-build -i development 7.0.1 $HOME/.phpenv/versions/7.0

# Setting phpenv to 7.0.1
echo "============ Setting phpenv to 7.0 ============"
phpenv rehash
phpenv global 7.0

# Install phpunit
echo "============ Installing PHPUnit ============="
wget https://phar.phpunit.de/phpunit.phar
chmod +x phpunit.phar
mv phpunit.phar $HOME/.phpenv/versions/7.0/bin/phpunit

# Install Composer
echo "============ Installing Composer ============"
curl -s http://getcomposer.org/installer | php
chmod +x composer.phar
mv composer.phar $HOME/.phpenv/versions/7.0/bin/composer

#install pickle
cd /tmp/pickle
$HOME/.phpenv/versions/7.0/bin/composer install

cd /
