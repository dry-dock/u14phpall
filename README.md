u14phpall
===============

Shippable CI image for PHP on Ubuntu 14.04. The following PHP versions are available:

  1. PHP 5.6.38
  2. PHP 7.0.32
  3. PHP 7.1.24
  4. PHP 7.2.12

Each PHP version is installed with php-build and managed with phpenv. Several
PHP extensions are also available out of the box. Unless otherwise noted, the
latest version of the extension at the time the image was built is what is
available in the image:

  1. PHP 5.6.38

      * amqp 1.6.0
      * bzip
      * intl
      * memcache
      * memcached 2.2.0
      * mongo
      * redis
      * zmq

  2. PHP 7.0.32, PHP 7.1.24 and PHP 7.2.12
      * amqp
      * bzip
      * intl
      * memcached
      * redis
      * zmq

u14phpall Docker Hub repo: [drydock/u14phpall](https://hub.docker.com/r/drydock/u14phpall/)

**Services**

This image is built on top of [u14all](https://github.com/dry-dock/u14all) .Please check 
there for a list of all the services.
