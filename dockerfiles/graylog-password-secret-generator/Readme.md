# estenrye/graylog-password-secret-generator

This Dockerfile creates a simple container that generates the password salt for
graylog.

## Building the image

```bash
docker build -t estenrye/graylog-password-secret-generator ./dockerfiles/graylog-password-secret-generator
```

## Generating a docker secret for Graylog's Password Secret

```bash
docker run --rm estenrye/graylog-password-secret-generator 96 | docker secret create graylog_password_secret -
```
