FROM mwader/static-ffmpeg:4.4.1

FROM ruby:3.0.3

COPY --from=0 /ffmpeg /usr/local/bin/ffmpeg
COPY ./build/generate-mp4-chapter-metadata /usr/local/bin/generate-mp4-chapter-metadata
COPY ./build/set-mp4-chapter-metadata /usr/local/bin/set-mp4-chapter-metadata

COPY ./entrypoint.sh /entrypoint.sh

WORKDIR /

ENTRYPOINT [ "/entrypoint.sh" ]
