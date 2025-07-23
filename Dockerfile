FROM alpine:3.22 as builder

# Download the OpenTofu binary with the specified version parameter
ARG TOFU_VERSION

RUN apk add --no-cache curl && \
    curl -L "https://github.com/opentofu/opentofu/releases/download/v${TOFU_VERSION}/tofu_${TOFU_VERSION}_linux_amd64.zip" -o opentofu.zip && \
    unzip opentofu.zip

FROM alpine:3.22

RUN apk add --no-cache git bash openssh

COPY --from=builder tofu /usr/local/bin/tofu

ENTRYPOINT ["/usr/local/bin/tofu"]