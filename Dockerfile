FROM debian:11

RUN apt-get update && apt-get install -yq wget git && \
    echo 'deb-src https://deb.sipwise.com/spce/mr10.2.1/ bullseye main' >> /etc/apt/sources.list.d/sipwise.list  && \
    echo 'deb https://deb.sipwise.com/spce/mr10.2.1/ bullseye main' >> /etc/apt/sources.list.d/sipwise.list && \
    wget -q -O - https://deb.sipwise.com/spce/keyring/sipwise-keyring-bootstrap.gpg | apt-key add -  && \
    apt-get update && \
    apt-get install -y ngcp-rtpengine

ENTRYPOINT ["rtpengine","--config-file=/etc/rtpengine/rtpengine.conf"]