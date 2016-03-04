#!/bin/bash
#sanzuwu@gamil.com
#写入计划到/etc/crontab
#每天凌晨2点17到2点26、下午3点17到3点26每分钟运行一次do.php
for i in {17..26};
do
  echo "${i} 2 * * * root php /data/http/do.php " >> /etc/crontab;
  echo "${i} 15 * * * root php /data/http/do.php " >> /etc/crontab;
done；

#启动cron
echo "====================================>starting cron<===================================="
cron start
echo "====================================>done!<===================================="
