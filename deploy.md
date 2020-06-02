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

### Mount Lab Storage NFS Share on deployment system

```bash
sudo mkdir -m 0770 -p /mnt/home-lab/alertmanager
sudo chgrp docker /mnt/home-lab/alertmanager
sudo mount -t nfs4 a.freenas.lab.ryezone.com:/mnt/main/home-lab-storage/alertmanager /mnt/home-lab/alertmanager

sudo mkdir -m 0770 -p /mnt/home-lab/grafana
sudo chgrp docker /mnt/home-lab/grafana
sudo mount -t nfs4 a.freenas.lab.ryezone.com:/mnt/main/home-lab-storage/grafana /mnt/home-lab/grafana

sudo mkdir -m 0770 -p /mnt/home-lab/prometheus
sudo chgrp docker /mnt/home-lab/prometheus
sudo mount -t nfs4 a.freenas.lab.ryezone.com:/mnt/main/home-lab-storage/prometheus /mnt/home-lab/prometheus
```

### Deploy the stacks
```bash
./deploy.sh
```