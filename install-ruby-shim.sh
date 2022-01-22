#!/bin/bash

# Use ruby if already installed, or fetch Ruby 3.0.3 docker image and setup in ~/bin
VERSION=3.0.3
echo "Looking for ruby...."

if ! command -v ruby &> /dev/null; then
  result=$(docker images | grep -i ruby)
  if [ -z "$result" ]; then
    # No, we don't. Pull it down
    echo "ruby not found, pulling down docker image"
    docker pull ruby:$VERSION
  else
    # Yes, we do. Use it.
    echo "ruby docker image found, using it"
  fi

  echo "docker run -i --rm -v "$PWD:$PWD" -w "$PWD" ruby:$VERSION" > ~/bin/ruby
  chmod +x ~/bin/ruby
else
  echo "$(ruby -v) found, using it"
fi