FROM	alpine:3.12.7
LABEL	maintainer="mamaquig@student.42.fr"

COPY	/tools /tools/

RUN		apk update &&\
		apk add php7 php7-fpm php7-mysqli php7-json mysql-client

RUN		sed -i 's/listen = 127\.0\.0\.1:9000/listen = 0\.0\.0\.0:9000/g' /etc/php7/php-fpm.d/www.conf

# RUN		wget https://fr.wordpress.org/latest-fr_FR.tar.gz -O /tools/wordpress.tar.gz
# RUN		tar -xf /tools/wordpress.tar.gz

EXPOSE	9000
ENTRYPOINT ["sh", "init_wp.sh"]
CMD ["php-fpm7", "-F"]