FROM mwader/static-ffmpeg:4.4.1

FROM ruby:3.0.3

WORKDIR /

COPY --from=0 /ffmpeg /usr/bin/ffmpeg

COPY ./build/video_scripts.gem /gems/video_scripts.gem
RUN gem install /gems/video_scripts.gem

ENTRYPOINT ["create-clips"]
