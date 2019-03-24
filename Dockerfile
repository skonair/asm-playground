FROM alpine:3.7

VOLUME /vol

RUN apk add --no-cache nasm build-base gdb


