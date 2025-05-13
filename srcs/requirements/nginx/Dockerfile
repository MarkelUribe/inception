FROM debian:oldstable

LABEL maintainer="muribe-l"

RUN apt -y update && \
	apt -y install nginx

COPY ./conf/default.conf /etc/nginx/sites-available/default


CMD ["nginx", "-g", "daemon off;"]
