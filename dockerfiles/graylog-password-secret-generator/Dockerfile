FROM alpine

RUN apk add --update pwgen \
    && rm -rf /var/cache/apk/*
COPY run.sh /opt/run.sh
ENTRYPOINT [ "sh", "/opt/run.sh" ]