#!/bin/bash

mkdir ./build

cp -r ../../lib ./build/lib
cp ../../generate-mp4-chapter-metadata build/
cp ../../set-mp4-chapter-metadata build/

docker build -t chapterize .
