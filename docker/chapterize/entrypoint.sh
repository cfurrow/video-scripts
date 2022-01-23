#!/bin/sh

/usr/local/bin/generate-mp4-chapter-metadata $1
/usr/local/bin/set-mp4-chapter-metadata $2
rm FFMETADATAFILE
