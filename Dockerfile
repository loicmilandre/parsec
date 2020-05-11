FROM armhf/debian:buster-slim
ENV DEBIAN_FRONTEND noninteractive
COPY qemu-arm-static /usr/bin

RUN apt-get update && apt-get clean

ADD https://s3.amazonaws.com/parsec-build/package/parsec-rpi.deb /root/parsec-rpi.deb

WORKDIR /root/
RUN dpkg -i parsec-rpi.deb && rm parsec-rpi.deb

RUN mkdir -p /root/.parsec && \
echo "encoder_h265 = 1" > /root/.parsec/config.txt
