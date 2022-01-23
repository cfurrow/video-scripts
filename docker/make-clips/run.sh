#!/bin/bash

docker run --rm -it -d --name="make-clips" -v "$PWD/VHS:/VHS" -v "$PWD/Clips:/Clips" make-clips
