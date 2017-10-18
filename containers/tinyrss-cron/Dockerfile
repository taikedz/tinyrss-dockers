FROM ubuntu:latest
MAINTAINER dch.tai@gmail.com

RUN apt-get update
RUN apt-get install -y php php-cli php-mysql php-mbstring php-fdomdocument cron

ADD cronrunner.sh /cronrunner.sh
RUN chmod 755 /cronrunner.sh

ADD crontab /etc/cron.d/ttrss-update
RUN chmod 644 /etc/cron.d/ttrss-update

VOLUME /var/www

ENTRYPOINT /cronrunner.sh
