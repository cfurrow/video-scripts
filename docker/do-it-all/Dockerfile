FROM chapterize:latest

FROM create-clips:latest

COPY --from=0 /entrypoint.sh /usr/bin/local/chapterize

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
