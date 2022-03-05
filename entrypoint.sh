#!/bin/sh

exec su-exec $UID:$GID darkhttpd /www/ --no-listing --port "$PORT" && darkhttpd /www-database/ --no-listing --port "$DPORT"