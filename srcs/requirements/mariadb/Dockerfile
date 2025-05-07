FROM debian:oldstable

RUN apt update && \ 
    apt install mariadb-server -y && \ 
    chown -R mysql:mysql /var/run/mysqld

EXPOSE 3306

CMD ["mysqld_safe"]
