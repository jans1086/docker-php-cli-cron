FROM php:5.6.14-cli
MAINTAINER ChengWei <chengwei@theqwan.com>

WORKDIR /

COPY cron /bin/cron
COPY run.sh /run.sh

CMD ["bash", "/run.sh"]