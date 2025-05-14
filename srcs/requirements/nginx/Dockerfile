FROM debian:oldstable

LABEL maintainer="muribe-l"

RUN apt -y update && \
	apt -y install nginx openssl

# generate ssl

RUN openssl req -x509 -nodes -days 365 -subj  "/C=CA/ST=QC/O=C Inc/CN=muribe-l.com" -newkey rsa:2048 -keyout /etc/nginx/selfsigned.key -out /etc/nginx/selfsigned.crt

COPY ./conf/default.conf /etc/nginx/nginx.conf


CMD ["nginx", "-g", "daemon off;"]
