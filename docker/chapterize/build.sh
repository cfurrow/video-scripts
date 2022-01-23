#!/bin/bash

mkdir ./build

# get latest version of video_scripts gem
latest_gem=`ls -t ../../pkg/video_scripts* | head -1`
cp "$latest_gem" ./build/video_scripts.gem

docker build -t chapterize .
