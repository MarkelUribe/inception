FROM debian:oldstable

RUN apt update && \ 
    apt install mariadb-server -y && \ 
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld

EXPOSE 3306

CMD ["mysqld_safe"]
