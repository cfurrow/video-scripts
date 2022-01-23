#!/bin/sh

TRANSCRIPT_FILE="$1"
INPUT_FILE="$2"

generate-mp4-chapter-metadata "$TRANSCRIPT_FILE"
set-mp4-chapter-metadata "$INPUT_FILE"

