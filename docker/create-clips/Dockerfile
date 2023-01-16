FROM mwader/static-ffmpeg:5.1.2

FROM ruby:3.1.2

WORKDIR /

COPY --from=0 /ffmpeg /usr/bin/ffmpeg

COPY ./build/video_scripts.gem /gems/video_scripts.gem
RUN gem install /gems/video_scripts.gem

ENTRYPOINT ["create-clips"]
