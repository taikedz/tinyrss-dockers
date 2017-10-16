#!/bin/bash

rm -rf /run/apache2/* /tmp/httpd*

exec /usr/sbin/apache2ctl -D FOREGROUND
