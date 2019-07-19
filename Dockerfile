FROM  szagv1337/lamp:v1

LABEL maintainer Mikhail E

RUN apt-get update
RUN apt-get -y install apache2 mysql-server php php-mysqli php-gd libapache2-mod-php git git apt-transport-https ca-certificates
RUN git clone https://github.com/szagvozdin123/docker-vulnerable-dvwa.git 



RUN chown www-data:www-data -R /var/www/html && \
    rm /var/www/html/index.html

EXPOSE 80


ENTRYPOINT ["/main.sh"]

