# VERSION  0.0.1

FROM tutum/apache-php
MAINTAINER smounives "smounives@outlook.com"

RUN apt-get update && apt-get install -y --force-yes git
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /app
RUN mkdir /data
RUN git clone https://github.com/kenvix/Tieba-Cloud-Sign /app/
RUN git clone https://github.com/kalcaddle/KODExplorer /app/explorer/
RUN chmod -R 755 /data
RUN chmod -R 755 /app

EXPOSE 80
