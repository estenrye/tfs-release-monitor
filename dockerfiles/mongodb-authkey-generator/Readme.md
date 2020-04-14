# estenrye/mongodb-authkey-generator

This Dockerfile creates a simple container that generates an authentication key
for MongoDB.

## Building the image

```bash
docker build -t estenrye/htpasswd .\dockerfiles\mongodb-authkey-generator
```

## Generating a auth key docker secret:

```bash
docker run --rm estenrye/mongodb-authkey-generator | docker secret create mongo_auth_secret -
```