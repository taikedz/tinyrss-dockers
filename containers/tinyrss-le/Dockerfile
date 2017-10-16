FROM ubuntu:latest
MAINTAINER tkedzierski@optos.com

RUN apt-get update
RUN apt-get install -y python python-pip
RUN pip install --upgrade pip

RUN pip install certbot

ADD my-fqdn.txt /root/my-fqdn.txt

ADD certbot.sh /certbot.sh
RUN chmod 755 /certbot.sh

VOLUME /var/www

VOLUME /etc/letsencrypt

ENTRYPOINT /certbot.sh
