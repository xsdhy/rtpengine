FROM debian:bullseye

USER root

RUN apt-get update && \
    apt-get install wget gnupg -y && \
    echo 'deb https://deb.sipwise.com/spce/mr11.3.1/ bullseye main' > /etc/apt/sources.list.d/sipwise.list && \
    echo 'deb-src https://deb.sipwise.com/spce/mr11.3.1/ bullseye main' >> /etc/apt/sources.list.d/sipwise.list && \
    wget https://deb.sipwise.com/spce/keyring/sipwise-keyring-bootstrap.gpg && \
    apt-key add sipwise-keyring-bootstrap.gpg && \
    apt-get update && \
    apt-get install -y ngcp-rtpengine

ENTRYPOINT ["rtpengine", "–config-file","/etc/rtpengine/rtpengine.conf","-f"]