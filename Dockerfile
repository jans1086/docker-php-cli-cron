FROM php:5.6.14-cli
MAINTAINER ChengWei <chengwei@theqwan.com>

WORKDIR /

COPY cron /bin/cron

CMD ["bash", "/bin/cron"]