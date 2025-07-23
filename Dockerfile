FROM alpine:3.22

RUN apk add --no-cache git bash openssh

COPY /tmp/opentofu /usr/local/bin/tofu

ENTRYPOINT ["/usr/local/bin/tofu"]