FROM mwader/static-ffmpeg:5.1.2

FROM ruby:3.1.2

COPY --from=0 /ffmpeg /usr/local/bin/ffmpeg

WORKDIR /

COPY ./build/video_scripts.gem /gems/video_scripts.gem
COPY ./entrypoint.sh /entrypoint.sh

RUN gem install /gems/video_scripts.gem



ENTRYPOINT [ "/entrypoint.sh" ]
