# Build PHP 5.5.39
echo "============ Building PHP 5.5 =============="
php-build -i development 5.5.31 $HOME/.phpenv/versions/5.5

# Setting phpenv to 5.5.31
echo "============ Setting phpenv to 5.5 ============"
phpenv rehash
phpenv global 5.5

# Install phpunit
echo "============ Installing PHPUnit ============="
wget https://phar.phpunit.de/phpunit-old.phar
chmod +x phpunit-old.phar
mv phpunit-old.phar $HOME/.phpenv/versions/5.5/bin/phpunit

# Install Composer
echo "============ Installing Composer ============"
curl -s http://getcomposer.org/installer | php
chmod +x composer.phar
mv composer.phar $HOME/.phpenv/versions/5.5/bin/composer

#install pickle
cd /tmp/pickle
$HOME/.phpenv/versions/5.5/bin/composer install

# Install php extensions
echo "=========== Installing PHP extensions =============="
printf '\n' | bin/pickle install memcache
printf '\n' | bin/pickle install memcached
printf '\n' | bin/pickle install mongo
printf '\n' | bin/pickle install amqp-1.6.0
printf '\n' | bin/pickle install zmq-beta
printf '\n' | bin/pickle install redis

cd /
