FROM golang:1.24-bookworm

# hadolint ignore=DL3008
RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /root
ARG OCB_VERSION=0.122.0
RUN curl --proto '=https' --tlsv1.2 -fL -o ocb "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/cmd%2Fbuilder%2Fv${OCB_VERSION}/ocb_${OCB_VERSION}_linux_amd64" \
 && chmod +x ocb \
 && mv ocb /usr/local/bin

WORKDIR /mnt
