FROM alpine:3.15

ENV USER darkhttpd
ENV GROUP darkhttpd
ENV GID 911
ENV UID 911
ENV PORT 8080

RUN addgroup -S ${GROUP} -g ${GID} && adduser -D -S -u ${UID} ${USER} ${GROUP} && \
    apk add -U --no-cache su-exec darkhttpd

# COPY --from=build-stage --chown=${USER}:${GROUP} /app/dist /www/
COPY --chown=${USER}:${GROUP} /app/dist /www/

COPY entrypoint.sh /entrypoint.sh

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://127.0.0.1:${PORT}/ || exit 1

EXPOSE ${PORT}