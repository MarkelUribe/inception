FROM debian:oldstable

RUN apt update
RUN apt install -y mariadb-server

#RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld
#RUN chown -R mysql:mysql /var/lib/mysql

#RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql

#COPY init.sql /etc/mysql/
#COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.

CMD ["mysqld_safe"]
#CMD ["tail", "-f"]
