FROM debian:jessie

RUN apt-get update && apt-get install -y \
  build-essential \
  ca-certificates \
  curl \
  binutils-dev \
  libmad0-dev \
  libgtk2.0-dev \
  libasound-dev \
  libjack-dev \
  libc6-dev \
  libogg-dev \
  libvorbis-dev \
  libxtst-dev \
  libxrandr-dev \
  libglew-dev \
  libav-tools \
  pulseaudio \
  && rm -rf /var/lib/apt/lists/*

ENV STEPMANIA_VERSION 5.0.10
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/stepmania

RUN mkdir -p /usr/local/stepmania \
  && curl -sSL https://github.com/stepmania/stepmania/releases/download/v${STEPMANIA_VERSION}/StepMania-${STEPMANIA_VERSION}-Linux.tar.gz | tar -v -C /usr/local/stepmania -xz --strip-components 2

ENTRYPOINT ["stepmania"]
