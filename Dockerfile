FROM alpine:3.18

RUN apk add --no-cache curl unzip ca-certificates

RUN curl -L -o /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
    && unzip /tmp/v2ray.zip -d /usr/local/bin/ \
    && rm -rf /tmp/v2ray.zip

COPY config.json /etc/v2ray/config.json

ENV PORT=8080
EXPOSE 8080

CMD ["v2ray", "-config=/etc/v2ray/config.json"]
