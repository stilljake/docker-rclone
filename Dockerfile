FROM alpine:latest

RUN apk update && apk add ca-certificates

#install build packages & cleanup
RUN apk update && apk add --no-cache --virtual=build-deps \
curl \
unzip \
wget && \
cd tmp && \
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
unzip /tmp/rclone-current-linux-amd64.zip && \
mv /tmp/rclone-*-linux-amd64/rclone /usr/bin/ && \
rm -rf \
    /tmp/* \
    /var/tmp/* \
    /var/cache/apk/* && \
apk del --purge build-deps

COPY /src /
RUN chmod +x /run.sh

VOLUME ["/data"]
VOLUME ["/root/.config/rclone/"]

CMD ["/run.sh"]
