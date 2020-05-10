FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get clean

WORKDIR /root/

ADD https://s3.amazonaws.com/parsec-build/package/parsec-rpi.deb parsec-rpi.deb

RUN dpkg -i parsec-rpi.deb && rm *.deb

RUN mkdir -p /root/.parsec && \
echo "encoder_h265 = 1" > /root/.parsec/config.txt
