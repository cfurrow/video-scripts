FROM mwader/static-ffmpeg:4.4.1

FROM python:3.10.2-alpine

COPY --from=0 /ffmpeg /usr/local/bin/ffmpeg
COPY ./generate-mp4-chapter-metadata /usr/local/bin/generate-mp4-chapter-metadata
COPY ./set-mp4-chapter-metadata /usr/local/bin/set-mp4-chapter-metadata

COPY ./entrypoint.sh /entrypoint.sh

WORKDIR /

ENTRYPOINT [ "/entrypoint.sh" ]
