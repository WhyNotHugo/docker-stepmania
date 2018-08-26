docker-stepmania
================

This docker image allows running stepmania inside a docker container.

Stepmania can be *hard* to get up and running:

* 5.0 is hard to build because it has very old dependencies.
* The upstream 5.0 binary has lots of old binary deps too, and won't work on a
  modern Linux setup (at least not on Arch)
* Using latest git version is incompatible with a lot of content on the web.
* Lots of themes, skinnotes, etc only work on 5.0.

Run this by using this helper script (add it to your path somewhere):

```
#!/bin/sh
#
# Runs stepmania inside a docker container

# Allow docker to connect to the local X11 instance.
xhost +local:docker

# Run stepmania itself.
docker run -it --rm\
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /home/$USER/stepmania:/root/.stepmania-5.0 \
  -e DISPLAY=$DISPLAY \
  -e PULSE_SERVER=unix:/path/to/pulseaudio/socket \
  -e PULSE_COOKIE=/run/pulse/cookie \
  -v /run/user/$UID/pulse/native:/path/to/pulseaudio/socket \
  -v ~/.config/pulse/cookie:/run/pulse/cookie \
  --device /dev/snd \
  whynothugo/stepmania
```

This should allow pulseaudio and X11 forwarding from the docker container. Just
dump your songs, etc inside `~/stepmania` (in the same fashion you'd use with
regular stepmania).
