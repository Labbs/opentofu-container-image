FROM alpine:3.22

RUN apk add --no-cache git bash openssh

WORKDIR /tmp/opentofu
COPY tofu /usr/local/bin/tofu

ENTRYPOINT ["/usr/local/bin/tofu"]