#!/bin/bash

echo "Looking for ffmpeg...."

# Look for ffmpeg command (or alias).
if ! command -v ffmpeg &> /dev/null; then
  # ffmpeg not found, do we have a docker image?
  result=$(docker images | grep -i ffmpeg)
  if [ -z "$result" ]; then
    # No, we don't. Pull it down
    echo "ffmpeg not found, pulling down docker image"
    docker pull mwader/static-ffmpeg:4.4.1
  else
    # Yes, we do. Use it.
    echo "ffmpeg docker image found, using it"
  fi

  echo 'docker run -i --rm -v "$PWD:$PWD" -w "$PWD" mwader/static-ffmpeg:4.4.1' > /usr/local/bin/ffmpeg
  chmod +x /usr/local/bin/ffmpeg
else
  echo "ffmpeg found, using it"
fi
