FROM alpine:latest

ENV OAUTH2_PROXY_PKG ${OAUTH2_PROXY_PKG:-oauth2_proxy-2.2.0.linux-amd64.go1.8.1}

WORKDIR /bin

ADD https://github.com/bitly/oauth2_proxy/releases/download/v2.2/${OAUTH2_PROXY_PKG}.tar.gz ./

RUN apk update                                          \
    && apk upgrade                                      \
    && apk add ca-certificates                          \
    && tar -xzvf ${OAUTH2_PROXY_PKG}.tar.gz --strip 1   \
    && rm ${OAUTH2_PROXY_PKG}.tar.gz                    \
    && rm -rf /var/cache/apk/*

COPY ./docker-entrypoint.sh .
ENTRYPOINT ["/bin/docker-entrypoint.sh"]
