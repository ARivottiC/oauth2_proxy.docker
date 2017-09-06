#!/bin/sh
set -e

exec ./oauth2_proxy                                             \
    --http-address "${OAUTH2_PROXY_HTTP_ADDRESS=0.0.0.0:4180}"  \
    -config "${OAUTH2_PROXY_CONFIG=/etc/oauth2_proxy.conf}"    \
    $@
