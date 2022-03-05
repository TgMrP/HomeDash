#!/bin/sh

# Ensure default assets are present.
while true; do echo n; done | cp -Ri /www/default-assets/* /www/assets/ &> /dev/null

exec su-exec $UID:$GID darkhttpd /www/ --no-listing --port "$PORT"