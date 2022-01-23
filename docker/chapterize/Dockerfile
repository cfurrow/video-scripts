FROM mwader/static-ffmpeg:4.4.1

FROM ruby:3.0.3

COPY --from=0 /ffmpeg /usr/local/bin/ffmpeg

WORKDIR /

COPY ./build/video_scripts.gem /gems/video_scripts.gem
COPY ./entrypoint.sh /entrypoint.sh

RUN gem install /gems/video_scripts.gem



ENTRYPOINT [ "/entrypoint.sh" ]
