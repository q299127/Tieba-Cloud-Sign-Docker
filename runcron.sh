#!/bin/bash
#Author:sanzuwu
#email:sanzuwu@gmail.com
#this is cron start script
for i in {15..25};
do
  echo "${i} 2 * * * root php /data/http/do.php ">>/etc/crontab;
  echo "${i} 15 * * * root php /data/http/do.php">>/etc/crontab;
done;
echo ================start cron================
cron start
echo ==================done====================

