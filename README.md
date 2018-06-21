u14phpall
===============

Shippable CI image for PHP on Ubuntu 14.04. The following PHP versions are available:

  1. PHP 5.6.32
  2. PHP 7.0.30
  3. PHP 7.1.18
  4. PHP 7.2.6

Each PHP version is installed with php-build and managed with phpenv. Several 
PHP extensions are also available out of the box. Unless otherwise noted, the 
latest version of the extension at the time the image was built is what is 
available in the image:

  1. PHP 5.6.32

      * amqp 1.6.0
      * bzip
      * intl
      * memcache
      * memcached 2.2.0
      * mongo
      * redis
      * zmq

  2. PHP 7.0.26 and PHP 7.1.12
      * amqp
      * bzip
      * intl
      * memcached
      * redis
      * zmq

## Services:

This image is built on top of https://github.com/dry-dock/u14all. Please check 
there for a list of all the services.
