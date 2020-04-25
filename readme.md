# TFS Release Monitor

This project provides a service hook target for TFS 2018 and Azure DevOps.


# Service Hook Reference

- [TFS 2018 Service Hook Reference](https://docs.microsoft.com/en-us/azure/devops/service-hooks/events?view=tfs-2018#ms.vss-release.deployment-started-event)
- [Azure DevOps Service Hook Reference](https://docs.microsoft.com/en-us/azure/devops/service-hooks/events?view=azure-devops#ms.vss-release.release-created-event) 


# Getting the application stack running.

## Initializing Docker Secrets

### Traefik Basic Auth Secret
1. Build `estenrye/htpasswd` or pull it from Docker Hub.
  - To build: 
  
    ```bash
    docker build -t estenrye/htpasswd -f .\dockerfiles\htpasswd\Dockerfile .\dockerfiles\htpasswd
    ```
2. To create the secret:

   ```bash
   docker run estenrye/htpasswd username password | docker secret create traefik_usersfile -
   ```

## Deploying the stack to Docker Swarm

### Initialize the swarm

```bash
docker swarm init
```

### Deploy the stack

#### On Windows for local development
```powershell
$env:PWD = Get-Location.Replace('\','/').Replace('C:/', '/c/')
docker stack deploy -c stack.yml -c stack.development.yml seis635
```
#### On Windows with TLS using LetsEncrypt

```powershell
$env:PWD = Get-Location.Replace('\','/').Replace('C:/', '/c/')
$env:TOP_LEVEL_DOMAIN = 'your-domain.com'
$env:LETS_ENCRYPT_EMAIL = 'noreply@your-domain.com'
$env:TRAEFIK_WEB_ENTRYPOINT='websecure'
docker stack deploy -c stack.yml -c stack.production.yml seis635
```

# Example Sites
* [Traefik Dashboard](https://traefik.seis635.ryezone.com)
* [Jaeger](https://jaeger.seis635.ryezone.com)
* [Grafana](htps://grafana.seis635.ryezone.com)
* [Prometheus](https://prometheus.seis635.ryezone.com)
* [Alert Manager](https://alertmanager.seis635.ryezone.com)
* [cAdvisor](https://cadvisor.seis635.ryezone.com)

# Pre-build Grafana Dashboards Used

### Docker Dashboards

* [vegasbrianc/prometheus](https://github.com/vegasbrianc/prometheus)

### Traefik Dashboards

* https://grafana.com/grafana/dashboards/11462
* https://grafana.com/grafana/dashboards/9357
* [vegasbrianc/docker-traefik-prometheus](https://github.com/vegasbrianc/docker-traefik-prometheus)