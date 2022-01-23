#!/bin/bash

mkdir -p /usr/local/bin

./install-ffmpeg-shim.sh
ffmpeg_command=$(command -v ffmpeg)
echo "ffmpeg command: $ffmpeg_command"

function install_script() {
  echo "Installing $1 to /usr/local/bin ..."
  # copy script to /usr/local/bin
  cp "$1" /usr/local/bin
  chmod +x /usr/local/bin/"$(basename "$1")"
}

install_script 'set-mp4-chapter-metadata'
install_script 'generate-mp4-chapter-metadata'
install_script 'create-clips'
install_script 'do-it-all'

# add /usr/local/bin to PATH if it does not exist
if ! echo $PATH | grep -q /usr/local/bin; then
  echo "PATH does not contain /usr/local/bin, adding it"
  export PATH=/usr/local/bin:$PATH
fi

echo "Done installing!"
echo -e "New commands:\n  generate-mp4-chapter-metadata - used to create FFMETADATAFILE\n  set-mp4-chapter-metadata - uses FFMETADATAFILE to add chapters to mp4\n  create-clips - Create clips from an mp4 file"
