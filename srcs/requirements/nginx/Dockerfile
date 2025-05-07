FROM debian:oldstable

LABEL maintainer="muribe-l"

RUN apt -y update && \
	apt -y install nginx

COPY ./conf/default.conf /etc/nginx/sites-available/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
