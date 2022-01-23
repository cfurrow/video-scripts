#!/bin/sh

cd ../chapterize
./build.sh

cd ../create-clips
./build.sh

cd ../do-it-all
docker build -t book-it .
