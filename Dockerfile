# VERSION  0.0.2

FROM webhippie/php-caddy

MAINTAINER sanzuwu  <sanzuwu@gmail.com>

EXPOSE 8080
RUN mkdir -p /app/tieba-cloud-sign
WORKDIR /app/tieba-cloud-sign

ENV DB_HOST='127.0.0.1'\
    DB_USER='root'\
    DB_PASSWD=''\
    DB_NAME='tiebacloud' \
    CONIFG_PATH='/app/tieba-cloud-sign/config.php' \
    CSRF='false'



RUN git clone https://github.com/MoeNetwork/Tieba-Cloud-Sign.git /app/tieba-cloud-sign && \
    rm -r /var/cache/apk && \
    rm -r /usr/share/man && \
    ls

RUN echo "* * * * * /usr/bin/php7 /app/tieba-cloud-sign/do.php" >> /etc/crontabs/root

ENTRYPOINT sed -i ''"$(cat ${CONIFG_PATH} -n | grep "DB_HOST" | awk '{print $1}')"'c '"$(echo "define('DB_HOST','${DB_HOST}');")"'' ${CONIFG_PATH} && \
              sed -i ''"$(cat ${CONIFG_PATH} -n | grep "DB_USER" | awk '{print $1}')"'c '"$(echo "define('DB_USER','${DB_USER}');")"'' ${CONIFG_PATH} && \
               sed -i ''"$(cat ${CONIFG_PATH} -n | grep "DB_PASSWD" | awk '{print $1}')"'c '"$(echo "define('DB_PASSWD','${DB_PASSWD}');")"'' ${CONIFG_PATH} && \
              sed -i ''"$(cat ${CONIFG_PATH} -n | grep "DB_NAME" | awk '{print $1}')"'c '"$(echo "define('DB_NAME','${DB_NAME}');")"'' ${CONIFG_PATH} && \
              sed -i ''"$(cat ${CONIFG_PATH} -n | grep "ANTI_CSRF" | awk '{print $1}')"'c '"$(echo "define('ANTI_CSRF',"${CSRF}");")"'' ${CONIFG_PATH} && \
              cat ${CONIFG_PATH} && \
              crond && \
              /bin/s6-svscan /etc/s6
