#!bin/sh

rm /etc/timezone
echo "Asia/Taipei" > /etc/timezone
chmod 644 /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

apt-get update
apt-get install -y --no-install-recommends runit
apt-get install -y --no-install-recommends cron

mkdir /etc/service/cron
chmod 600 /etc/crontab

cp /prepare_install/cron.runit /etc/service/cron/run
chmod -R 700 /etc/service/cron/

rm -f /etc/cron.daily/standard
rm -f /etc/cron.daily/upstart
rm -f /etc/cron.daily/dpkg
rm -f /etc/cron.daily/password
rm -f /etc/cron.weekly/fstrim

apt-get clean
rm -rf /prepare_install