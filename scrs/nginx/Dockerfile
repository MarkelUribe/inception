FROM debian:oldstable

LABEL maintainer="muribe-l"

RUN 	apt -y update && \
	apt -y install nginx

COPY ./conf/default.conf /etc/nginx/sites-available/default

EXPOSE 8080

CMD ["nginx", "-s", "reload"]
