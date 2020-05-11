### Traefik Basic Auth Secret

1. Build `estenrye/htpasswd` or pull it from Docker Hub.

  - To build: 
  
    ```bash
    docker build -t estenrye/htpasswd ./dockerfiles/htpasswd
    ```

2. To create the secret:

   ```bash
   docker run --rm estenrye/htpasswd 'username' 'password' | docker secret create traefik_usersfile -
   ```

### Create public network.

```bash
docker network create --attachable --driver overlay public
```