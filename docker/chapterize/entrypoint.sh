#!/bin/sh

TRANSCRIPT_FILE="$1"
INPUT_FILE="$2"

/usr/local/bin/generate-mp4-chapter-metadata $TRANSCRIPT_FILE
/usr/local/bin/set-mp4-chapter-metadata $INPUT_FILE

