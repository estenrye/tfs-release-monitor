FROM alpine

# install openssl
RUN apk add --update openssl && \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ "openssl", "rand", "-base64", "741" ]