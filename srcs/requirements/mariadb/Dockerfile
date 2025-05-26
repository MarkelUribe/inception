FROM debian:oldstable

RUN apt update
RUN apt install -y mariadb-server

RUN mkdir /run/mysqld && chmod 750 /var/lib/mysql

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.

RUN touch /etc/mysql/init.sql
RUN chmod +wrx /etc/mysql/init.sql

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
