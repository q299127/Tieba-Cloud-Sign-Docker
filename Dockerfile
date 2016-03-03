# VERSION  0.0.1

FROM maxexcloo/nginx-php
MAINTAINER smounives "smounives@outlook.com"

RUN apt-get update && apt-get install -y --force-yes git cron procps
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /data/http
RUN git clone https://github.com/q299127/Tieba-Cloud-Sign /data/http/
RUN git clone https://github.com/kalcaddle/KODExplorer /data/http/explorer/
RUN echo '*/1 * * * * root php /data/http/do.php' >> /etc/crontab
COPY runcron.sh /runcron.sh 
RUN chmod +777 /runcron.sh
RUN sh /runcron.sh
EXPOSE 80
#CMD ("/runcron.sh")
