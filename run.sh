#!/bin/bash

set -e

docker build --rm -t parsec-rpi .

docker run \
--env LD_LIBRARY_PATH=/opt/vc/lib  \
--volume /opt/vc/lib/libopenmaxil.so:/opt/vc/lib/libopenmaxil.so \
--volume /opt/vc/lib/libbcm_host.so:/opt/vc/lib/libbcm_host.so \
--volume /opt/vc/lib/libvcos.so:/opt/vc/lib/libvcos.so \
--volume /opt/vc/lib/libvchiq_arm.so:/opt/vc/lib/libvchiq_arm.so \
--volume /opt/vc/lib/libbrcmGLESv2.so:/opt/vc/lib/libbrcmGLESv2.so \
--volume /opt/vc/lib/libbrcmEGL.so:/opt/vc/lib/libbrcmEGL.so \
--privileged --rm -it parsec-rpi

