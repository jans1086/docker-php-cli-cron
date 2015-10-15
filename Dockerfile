FROM php:5.6.14-cli
MAINTAINER ChengWei <chengwei@theqwan.com>

ADD . /prepare_install

RUN chmod -R 700 /prepare_install
RUN /prepare_install/install.sh

CMD ["runsv", "/etc/service/cron"]