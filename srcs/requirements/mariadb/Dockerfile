FROM debian:oldstable

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update 
RUN apt install mariadb-server -y
RUN mkdir -p /var/run/mysqld /var/lib/mysql
RUN chown -R mysql:mysql /var/run/mysqld /var/lib/mysql && \
 chmod 755 /var/run/mysqld

CMD ["mysqld", "--user=root"]
