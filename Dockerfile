FROM alpine:3.21.3

RUN apk add --no-cache keepalived iputils
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]