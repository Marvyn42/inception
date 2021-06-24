FROM	alpine:3.12.7
LABEL	maintainer="mamaquig@student.42.fr"

COPY	/tools /tools/

RUN		apk update &&\
		php php7-fpm php7-mysqli php7-json php7-phar php7-iconv php7-mbstring mariadb-client
		# apk add php7 php7-fpm php7-mysqli php7-json mysql-client

RUN		sed -i 's/listen = 127\.0\.0\.1:9000/listen = 0\.0\.0\.0:9000/g' /etc/php7/php-fpm.d/www.conf

EXPOSE	9000
ENTRYPOINT ["sh", "init_wp.sh"]
CMD ["php-fpm7", "-F"]
