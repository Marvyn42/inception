FROM    alpine:3.12.7
LABEL	maintainer="mamaquig@student.42.fr"

COPY 	/tools /tools/
COPY	/nginx.conf /etc/nginx/nginx.conf

RUN		apk update &&\
		apk add nginx

RUN		mkdir /run/nginx &&\
		adduser -D -g 'www' www

EXPOSE  443
CMD ["nginx", "-g", "daemon off;"]
