FROM node:lts-alpine
FROM stedolan/jq

COPY run.sh /opt/run.sh

RUN apk add --no-cache git make g++ python \
  && mkdir -p /opt && cd /opt \
  && git clone https://github.com/samcm/synclounge

COPY settings.sh /opt/synclounge/settings.sh
RUN chmod +x /opt/synclounge/settings.sh

RUN /opt/synclounge/settings.sh "webroot"
RUN /opt/synclounge/settings.sh "webapp_port"
RUN /opt/synclounge/settings.sh "server_port"
RUN /opt/synclounge/settings.sh "serverroot"
RUN /opt/synclounge/settings.sh "accessUrl"
RUN /opt/synclounge/settings.sh "autoJoin"
RUN /opt/synclounge/settings.sh "autoJoinServer"
RUN /opt/synclounge/settings.sh "autoJoinRoom"
RUN /opt/synclounge/settings.sh "autoJoinPassword"
RUN /opt/synclounge/settings.sh "authentication"
RUN /opt/synclounge/settings.sh "customServer"
RUN /opt/synclounge/settings.sh "servers"

RUN cd /opt/synclounge \
  && npm install \
  && npm run build \
  && apk del make g++ python \
  && rm -rf /tmp/* /root/* \
  && chmod a+x /opt/run.sh

EXPOSE 8088 8089

CMD ["/opt/run.sh"]
