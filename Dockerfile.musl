FROM ganehag/br-fa526:2017.02

LABEL maintainer "mikael.brorsson@gmail.com"

WORKDIR /src/$BUILDROOT_VERSION

COPY external /src/external
COPY ts7500utils output/build/ts7500utils-1.0

RUN \
  echo "=====> extraction Musl toolchain" && \
  mkdir -p /opt/musleabi && \
  tar xzf /opt/toolchain-arm-buildroot-linux-musleabi.tar.gz -C /opt/musleabi && \
  \
  \
  echo "=====> building system" && \
  make BR2_EXTERNAL=/src/external ts7500_musl_defconfig && \
  touch output/build/ts7500utils-1.0/.stamp_downloaded && \
  touch output/build/ts7500utils-1.0/.stamp_extracted && \
  ln -sf /images output/images

VOLUME ["/src/$BUILDROOT_VERSION/configs"]

CMD make
