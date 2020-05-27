FROM ubuntu:20.04
RUN apt-get update && DEBIAN_FRONTEND=noninteractive && apt-get install -y --no-install-recommends tzdata
RUN apt-get -y install lib32z1 lib32ncurses5-dev lib32gcc1 openssl libssl-dev
RUN ln -s /lib/x86_64-linux-gnu/libssl.so.1.0.0 /usr/lib/libssl.so && \
    useradd -m worker
RUN mkdir /home/worker/data && \
    mkdir /home/worker/log && \
    chown -R worker:worker /home/worker
WORKDIR /home/worker/
USER worker
COPY primusquery /home/worker/