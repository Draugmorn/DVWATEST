FROM  szagv1337/lamp:v1

LABEL maintainer Mikhail E

RUN apt-get update
RUN apt-get install vim  git apt-transport-https ca-certificates \
curl software-properties-common php5-cli –y
RUN git clone https://github.com/szagvozdin123/docker-vulnerable-dvwa.git 

COPY php.ini /etc/php5/apache2/php.ini
COPY dvwa /var/www/html
COPY my.cnf /etc/mysql/my.cnf

RUN chown www-data:www-data -R /var/www/html && \
    rm /var/www/html/index.html

EXPOSE 80

COPY main.sh /
ENTRYPOINT ["/main.sh"]

