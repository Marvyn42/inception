FROM    alpine:3.12.7
LABEL	maintainer="mamaquig@student.42.fr"

ARG		MYSQL_CLIENT
ARG		MYSQL_NAME
ARG		MYSQL_USER
ARG		MYSQL_PASSWORD

COPY 	/tools/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN     apk update &&\
        apk add mysql mysql-client
RUN     mkdir run/mysqld && chown mysql /run/mysqld
RUN     mysql_install_db --user=mysql --datadir=/var/lib/mysql

RUN     mysqld -umysql &\
        sleep 3 &&\
        echo "CREATE DATABASE $MYSQL_NAME;" | mysql &&\
        echo "CREATE USER '$MYSQL_USER'@'$MYSQL_CLIENT' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql &&\
        echo "GRANT ALL PRIVILEGES ON $MYSQL_NAME.* TO '$MYSQL_USER'@'$MYSQL_CLIENT';" | mysql &&\
        echo "FLUSH PRIVILEGES;" | mysql

EXPOSE 3306
CMD ["mysqld", "-umysql"]
