#!/bin/sh

exec su-exec $UID:$GID darkhttpd /www/ --no-listing --port "$PORT"
exec su-exec $UID:$GID darkhttpd /www-database/ --no-listing --port "$DPORT"