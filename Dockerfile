FROM alpine:latest

ARG VERSION=0.1.0-rc.1
ARG TARGETARCH

RUN apk add --no-cache unzip ca-certificates

ADD https://ganigeorgiev.com/meta/bugstage/bugstage/download/v${VERSION}/bugstage_${VERSION}_linux_${TARGETARCH}.zip /tmp/bugstage.zip

RUN unzip /tmp/bugstage.zip -d /app/ && rm /tmp/bugstage.zip

WORKDIR /app

VOLUME /app/pb_data

EXPOSE 8090 8022

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget -q -O /dev/null http://localhost:8090/api/health || exit 1

ENTRYPOINT ["/app/bugstage", "serve", "--http=0.0.0.0:8090"]
