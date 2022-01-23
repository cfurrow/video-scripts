#!/bin/bash

cp ../../generate-mp4-chapter-metadata .
cp ../../set-mp4-chapter-metadata .

docker build -t chapterize .
