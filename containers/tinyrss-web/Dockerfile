FROM ubuntu:latest
MAINTAINER tkedzierski@optos.com

RUN apt-get update
RUN apt-get install -y apache2 php libapache2-mod-php git ca-certificates

WORKDIR /var/www
RUN rm -r html

RUN git clone https://tt-rss.org/git/tt-rss.git tt-rss

RUN ln -s /var/www/tt-rss html

VOLUME /var/www
VOLUME /etc/letsencrypt

EXPOSE 80 443

ADD apache.sh /apache.sh
RUN chmod 755 /apache.sh

ENTRYPOINT /apache.sh
