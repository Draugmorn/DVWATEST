FROM ubuntu:16.04

LABEL maintainer Mikhail E

RUN apt-get update
RUN apt-get install -y php7.0-fpm vim git apt-transport-https ca-certificates supervisor && \ 
    rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/Draugmorn/DVWATEST 

COPY dvwa /var/www/html
COPY my.cnf /etc/mysql/my.cnf

RUN chown www-data:www-data -R /var/www/html && \
    rm /var/www/html/index.html

EXPOSE 80

COPY main.sh /
ENTRYPOINT ["/main.sh"]

