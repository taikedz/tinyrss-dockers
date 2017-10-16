FROM alpine:latest
MAINTAINER tkedzierski@optos.com

RUN apk update
RUN apk add php7 php7-cli

ADD cronrunner.sh /cronrunner.sh
RUN chmod 755 /cronrunner.sh

VOLUME /var/www

ENTRYPOINT /cronrunner.sh
