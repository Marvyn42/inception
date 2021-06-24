FROM    alpine:3.12.7
LABEL	maintainer="mamaquig@student.42.fr"

COPY 	/tools /tools/
COPY 	/tools/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN     apk update &&\
        apk add mysql mysql-client
RUN     mkdir run/mysqld && chown mysql /run/mysqld
RUN     mysql_install_db --user=mysql --datadir=/var/lib/mysql

RUN     mysqld -umysql &\
        sleep 3 &&\
        echo "CREATE DATABASE newdb;" | mysql &&\
        echo "CREATE USER 'mama'@'%' IDENTIFIED BY 'DBpassword';" | mysql &&\
        echo "GRANT ALL PRIVILEGES ON newdb.* TO 'mama'@'%';" | mysql &&\
        echo "FLUSH PRIVILEGES;" | mysql

EXPOSE 3306
CMD ["mysqld", "-umysql"]