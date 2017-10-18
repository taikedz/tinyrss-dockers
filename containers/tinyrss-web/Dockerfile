FROM ubuntu:latest
MAINTAINER tkedzierski@optos.com

RUN apt-get update
RUN apt-get install -y apache2 php libapache2-mod-php git ca-certificates
RUN apt-get install -y apache2 php-mysql php-mbstring php-fdomdocument

WORKDIR /var/www
RUN rm -r html

RUN git clone https://tt-rss.org/git/tt-rss.git tt-rss

RUN ln -s /var/www/tt-rss html

EXPOSE 80 443

RUN chown -R www-data:www-data /var/www/tt-rss
RUN chmod -R 775 /var/www/tt-rss
ADD apache.sh /apache.sh
RUN chmod 755 /apache.sh

VOLUME /var/www
VOLUME /etc/letsencrypt

ENTRYPOINT /apache.sh
