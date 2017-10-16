FROM ubuntu:latest
MAINTAINER tkedzierski@optos.com

RUN apt-get update
RUN apt-get install software-properties-common -y
RUN echo|add-apt-repository ppa:certbot/certbot
Run apt update && apt install python-certbot-apache -y


ADD certbot.sh /certbot.sh
RUN chmod 755 /certbot.sh

VOLUME /var/www

VOLUME /etc/letsencrypt

ENTRYPOINT /certbot.sh
