#!/bin/sh

exec su-exec $UID:$GID darkhttpd /www/ --no-listing --port "$PORT"