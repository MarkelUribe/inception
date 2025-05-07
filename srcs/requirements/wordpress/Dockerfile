FROM debian:oldstable

LABEL maintainer="muribe-l"

# MariaDB
#EXPOSE 3306
# WordPress
#EXPOSE 9000

RUN apt -y update && \
    apt -y install wordpress && \
    apt install php-fpm php-mysql -y && \
    apt -y install curl

CMD ["tail", "-f"];
