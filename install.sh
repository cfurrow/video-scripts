#!/bin/bash

./install-ffmpeg-shim.sh
ffmpeg_command=$(command -v ffmpeg)
echo "ffmpeg command: $ffmpeg_command"

# copy set-chapter-metadata.sh to ~/bin directory
echo "Installing set-mp4-chapter-metadata to ~/bin ..."
cp set-mp4-chapter-metadata ~/bin
chmod +x ~/bin/set-mp4-chapter-metadata

echo "Installing generate-mp4-chapter-metadata to ~/bin ..."
cp generate-mp4-chapter-metadata ~/bin
chmod +x ~/bin/generate-mp4-chapter-metadata

# add ~/bin to PATH if it does not exist
if ! echo $PATH | grep -q ~/bin; then
  echo "PATH does not contain ~/bin, adding it"
  export PATH=~/bin:$PATH
fi

