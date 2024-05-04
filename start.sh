#!/usr/bin/env bash

export OAUTH2_PROXY_OIDC_ISSUER_URL="${OAUTH2_PROXY_OIDC_ISSUER_URL:=https://hk-id.my.salesforce.com}"
export REDIS_URL="${CACHE_URL:-$REDIS_URL}"
if [[ "$REDIS_URL" != "" ]]; then
    EXTRA="--session-store-type=redis --redis-connection-url $CACHE_URL --redis-insecure-skip-tls-verify"
fi
exec ./bin/oauth2-proxy --email-domain '*' --alpha-config config.yaml --standard-logging --auth-logging --request-logging --skip-provider-button=true $EXTRA
