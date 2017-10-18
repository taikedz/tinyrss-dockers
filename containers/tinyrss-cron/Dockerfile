FROM ubuntu:latest
MAINTAINER dch.tai@gmail.com

RUN apt-get update
RUN apt-get install -y php php-cli
RUN apt-get install -y cron

ADD cronrunner.sh /cronrunner.sh
RUN chmod 755 /cronrunner.sh

VOLUME /var/www

ENTRYPOINT /cronrunner.sh
