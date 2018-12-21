FROM alpine:3.8
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing stm32flash
ENTRYPOINT ["/usr/bin/stm32flash"]
