FROM debian:oldstable

RUN apt update
RUN apt install -y mariadb-server

RUN mkdir /run/mysqld

RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql

COPY init.sql /etc/mysql/
COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

CMD ["mysqld"]
