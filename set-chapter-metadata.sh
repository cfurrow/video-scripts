#!/bin/bash
# We need to expand aliases, if any.
shopt -s expand_aliases
. /boot/config/setup_aliases.sh

INPUT=$1
filename=$(basename -- "$INPUT")
extension="${filename##*.}"
filename="${filename%.*}"
OUTPUT="$filename-chapters.$extension"

echo "Input: $INPUT"
echo "Output: $OUTPUT"

ffmpeg -i "$INPUT" -i FFMETADATAFILE -map_metadata 1 -codec copy "$OUTPUT"
