# estenrye/htpasswd

This Dockerfile creates a simple container that generates an htpasswd file for
Traefik's Basic Auth middleware.

## Building the image

```bash
docker build -t estenrye/htpasswd .\dockerfiles\htpasswd
```

## Generating a docker secret for Traefik's Basic Auth Middleware

```bash
docker run --rm estenrye/htpasswd username password | docker secret create traefik_usersfile -
```
