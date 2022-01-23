#!/bin/bash

docker run --rm -it -d --name="create-clips" -v "$PWD/VHS:/VHS" -v "$PWD/Clips:/Clips" create-clips
