FROM debian:oldstable

RUN apt update && \
    apt -y install php-fpm php-mysqli curl && \
    mkdir -p /run/php

COPY www.conf /etc/php/7.4/fpm/pool.d/.
COPY ./script.sh .
RUN chmod +x script.sh

CMD ["./script.sh"]
#CMD ["php-fpm7.4", "-F"]