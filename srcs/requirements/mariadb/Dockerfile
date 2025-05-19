FROM debian:oldstable

RUN apt update
RUN apt install -y mariadb-server

RUN mkdir /run/mysqld && chmod 750 /var/lib/mysql

COPY init.sql /etc/mysql/
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
