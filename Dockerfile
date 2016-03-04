# VERSION  0.0.1

FROM maxexcloo/nginx-php
MAINTAINER smounives "smounives@outlook.com"

RUN apt-get update && apt-get install -y --force-yes git cron procps
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /data/http
RUN git clone https://github.com/q299127/Tieba-Cloud-Sign /data/http/
RUN git clone https://github.com/kalcaddle/KODExplorer /data/http/explorer/
#RUN echo '*/1 * * * * root php /data/http/do.php' >> /etc/crontab
#将运行脚本复制到/config文件夹下，并改名为inti03，这里基础镜像加入了运行脚本loop，循环执行/config下init××脚本
COPY runcron.sh /config/init03 
RUN chmod 777 /config/init03
#RUN sh /runcron.sh
EXPOSE 80
#CMD ("/runcron.sh")
