FROM mwader/static-ffmpeg:4.4.1

FROM alpine:3.14

WORKDIR /

COPY --from=0 /ffmpeg /bin/ffmpeg

COPY make-clips.sh /bin/make-clips.sh

RUN chmod +x /bin/make-clips.sh

ENTRYPOINT ["/bin/make-clips.sh"]
