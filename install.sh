#!/bin/bash

mkdir -p /usr/local/bin

./install-ffmpeg-shim.sh
ffmpeg_command=$(command -v ffmpeg)
echo "ffmpeg command: $ffmpeg_command"

# copy set-chapter-metadata.sh to /usr/local/bin directory
echo "Installing set-mp4-chapter-metadata to /usr/local/bin ..."
cp set-mp4-chapter-metadata /usr/local/bin/set-mp4-chapter-metadata
chmod +x /usr/local/bin/set-mp4-chapter-metadata

echo "Installing generate-mp4-chapter-metadata to /usr/local/bin ..."
cp generate-mp4-chapter-metadata /usr/local/bin/generate-mp4-chapter-metadata
chmod +x /usr/local/bin/generate-mp4-chapter-metadata

echo "Installing create-clips to /usr/local/bin ..."
cp create-clips /usr/local/bin/create-clips
chmod +x /usr/local/bin/create-clips

# add /usr/local/bin to PATH if it does not exist
if ! echo $PATH | grep -q /usr/local/bin; then
  echo "PATH does not contain /usr/local/bin, adding it"
  export PATH=/usr/local/bin:$PATH
fi

echo "Done installing!"
echo -e "New commands:\n  generate-mp4-chapter-metadata - used to create FFMETADATAFILE\n  set-mp4-chapter-metadata - uses FFMETADATAFILE to add chapters to mp4\n  create-clips - Create clips from an mp4 file"
