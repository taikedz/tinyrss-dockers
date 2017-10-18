FROM ubuntu:latest
MAINTAINER dch.tai@gmail.com

RUN apt-get update
RUN apt-get install -y apache2 php libapache2-mod-php git ca-certificates
RUN apt-get install -y apache2 php-mysql php-mbstring php-fdomdocument

WORKDIR /var/www
RUN rm -r html

RUN git clone https://tt-rss.org/git/tt-rss.git tt-rss

RUN ln -s /var/www/tt-rss html

EXPOSE 80 443

RUN chown -R www-data:www-data /var/www/tt-rss
RUN find /var/www/tt-rss -type d -exec chmod -R 775 {} \; >/dev/null
RUN find /var/www/tt-rss -type f -exec chmod -R 664 {} \; >/dev/null
ADD apache.sh /apache.sh
RUN chmod 755 /apache.sh

VOLUME /var/www
VOLUME /etc/letsencrypt

ENTRYPOINT /apache.sh
