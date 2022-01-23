#!/bin/sh

TIMESTAMP_FILE="$1"
INPUT_FILE="$2"
CLIPS_DIR="$3"

echo "This does not work yet."
exit 1

/usr/local/bin/chapterize "$TIMESTAMP_FILE" "$INPUT_FILE"
/usr/local/bin/create-clips --from_file "$TIMESTAMP_FILE" "$INPUT_FILE" "$CLIPS_DIR"
