FROM alpine:3.10

RUN set -ex && \
  apk add --no-cache bash coreutils git grep openssl sed util-linux && \
  apk add --no-cache --virtual .install-deps curl && \
  curl -fsSL -o /usr/local/bin/transcrypt https://raw.githubusercontent.com/elasticdog/transcrypt/v2.0.0/transcrypt && \
  echo "041467f8e310b204e4760dad31aec9cfda5ae9bf9140c028584bc80b8c4dcc6b  /usr/local/bin/transcrypt" | sha256sum -c  && \
  chmod +x /usr/local/bin/transcrypt && \
  apk del --no-network .install-deps
