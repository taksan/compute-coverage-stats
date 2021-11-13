FROM alpine:edge

RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing lcov
RUN apk add --no-cache gawk
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]