FROM mwader/static-ffmpeg:4.4.1

FROM alpine:3.14

WORKDIR /

COPY --from=0 /ffmpeg /usr/bin/ffmpeg

COPY ./create-clips /usr/bin/create-clips

RUN chmod +x /usr/bin/create-clips

ENTRYPOINT ["/usr/bin/create-clips"]
