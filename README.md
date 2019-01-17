u14phpall
===============

Shippable CI image for PHP on Ubuntu 14.04. The following PHP versions are available:

  1. PHP 7.1.25
  2. PHP 7.2.14
  3. PHP 7.3.1

Each PHP version is installed with php-build and managed with phpenv. Several
PHP extensions are also available out of the box. Unless otherwise noted, the
latest version of the extension at the time the image was built is what is
available in the image:


  1. PHP 7.1.25, PHP 7.2.14 and PHP 7.3.1
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
