#!/bin/bash -e

#Build PHP 7.2.5
echo "============ Building PHP 7.2.5 =============="
PHP_BUILD_CONFIGURE_OPTS="--with-bz2 --enable-intl" php-build -i development 7.2.5 $HOME/.phpenv/versions/7.2

# Setting phpenv to 7.2.5
echo "============ Setting phpenv to 7.2 ============"
phpenv rehash
phpenv global 7.2

# Install phpunit
echo "============ Installing PHPUnit ============="
wget -nv https://phar.phpunit.de/phpunit-7.0.3.phar
chmod +x phpunit-7.0.3.phar
mv phpunit-7.0.3.phar $HOME/.phpenv/versions/7.2/bin/phpunit



