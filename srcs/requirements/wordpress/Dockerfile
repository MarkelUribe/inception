FROM debian:oldstable

RUN apt update && \
    apt -y install php-fpm php-mysqli curl

COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./script.sh .
RUN chmod +x script.sh

CMD ["./script.sh"]