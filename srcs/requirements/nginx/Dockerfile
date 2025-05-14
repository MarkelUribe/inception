FROM debian:oldstable

LABEL maintainer="muribe-l"

RUN apt -y update && \
	apt -y install nginx

# generate ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=ES/ST=Vizcaya/L=Urduliz/O=42/OU=42Urduliz/CN=muribe-l-42.fr"

COPY ./conf/default.conf /etc/nginx/sites-available/default


CMD ["nginx", "-g", "daemon off;"]
