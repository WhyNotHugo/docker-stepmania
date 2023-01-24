FROM debian:jessie

RUN apt-get update && apt-get install -y --force-yes \
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

# Uncomment these lines if using nvidia.
# This was last testing in 2018. No idea if it works on Wayland.
#ENV NVIDIA_VERSION 390.48
#RUN cd /tmp && curl -sSLO http://us.download.nvidia.com/XFree86/Linux-x86_64/${NVIDIA_VERSION}/NVIDIA-Linux-x86_64-${NVIDIA_VERSION}-no-compat32.run
#RUN apt-get update && apt-get install kmod
#RUN sh /tmp/NVIDIA-Linux-x86_64-${NVIDIA_VERSION}-no-compat32.run -a -N --ui=none --no-kernel-module

ENTRYPOINT ["stepmania"]
