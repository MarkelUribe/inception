FROM debian:oldstable

RUN apt -y update && \
	apt -y install nginx openssl

COPY ./conf/default /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]
