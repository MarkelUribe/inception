FROM debian:oldstable

LABEL maintainer="muribe-l"

RUN apt -y update && \
    apt -y install wordpress && \
    apt install php-fpm php-mysql -y && \
    apt -y install curl

#COPY tools/init.sh /init.sh
#RUN chmod +x /init.sh

WORKDIR /var/www/html
#CMD [ "/init.sh" ]