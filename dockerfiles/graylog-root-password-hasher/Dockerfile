FROM alpine

RUN apk add --update perl-utils \
    && rm -rf /var/cache/apk/*
COPY run.sh /opt/run.sh
ENTRYPOINT [ "sh", "/opt/run.sh" ]
