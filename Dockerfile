FROM php:5.6.14-cli
MAINTAINER ChengWei <chengwei@theqwan.com>

RUN rm /etc/timezone \
	&& echo "Asia/Taipei" > /etc/timezone \
	&& chmod 644 /etc/timezone \
	&& dpkg-reconfigure --frontend noninteractive tzdata \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends runit \
	&& apt-get install -y --no-install-recommends cron \
	&& apt-get install -y --no-install-recommends vim \
	&& BUILD_PACKAGES="curl libcurl3 libcurl3-dev php5-curl supervisor nginx php5-fpm git php5-mysql php-apc php5-curl php5-gd php5-intl php5-mcrypt php5-memcache php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-pgsql php5-mongo php5-ldap pwgen php5-redis"  \
        && apt-get -y install $BUILD_PACKAGES \
	&& mkdir /etc/service/cron \
	&& echo '#!/bin/sh' > /etc/service/cron/run \
	&& echo 'exec /usr/sbin/cron -f' >> /etc/service/cron/run \
	&& chmod -R 700 /etc/service/cron/ \
	&& chmod 600 /etc/crontab \
	&& rm -f /etc/cron.daily/standard \
	&& rm -f /etc/cron.daily/upstart \
	&& rm -f /etc/cron.daily/dpkg \
	&& rm -f /etc/cron.daily/password \
	&& rm -f /etc/cron.weekly/fstrim \
	&& apt-get purge -y --auto-remove \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

CMD ["runsv", "/etc/service/cron"]
