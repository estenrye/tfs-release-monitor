# estenrye/graylog-root-password-hasher

This Dockerfile creates a simple container that generates the root user password
hash for Graylog.

## Building the image

```bash
docker build -t estenrye/graylog-root-password-hasher ./dockerfiles/graylog-root-password-hasher
```

## Generating a docker secret for Graylog's Root User Password Hash

```bash
docker run --rm estenrye/graylog-root-password-hasher yourpasswordhere | docker secret create graylog_root_password -
```
