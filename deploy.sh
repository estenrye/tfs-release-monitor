export TOP_LEVEL_DOMAIN='dev.lab.ryezone.com'
export TRAEFIK_WEB_ENTRYPOINT='web'
export ENABLE_ADMIN_PORT='false'

docker network create --attachable --driver overlay public
docker network create --attachable --driver overlay monitor

docker stack deploy -c ./stacks/data_systems/jaeger.stack.yml jaeger
docker stack deploy -c ./stacks/network_systems/traefik.stack.yml -c ./stacks/network_systems/traefik.development.stack.yml traefik

sudo cp -r ./alertmanager /mnt/home-lab
sudo cp -r ./grafana/provisioning /mnt/home-lab/grafana/config
sudo mkdir -p /mnt/home-lab/grafana/data
sudo cp -r ./prometheus /mnt/home-lab/prometheus/config
sudo mkdir -p /mnt/home-lab/prometheus/data

docker stack deploy -c ./stacks/metrics_systems/prometheus.stack.yml prometheus
docker stack deploy -c ./stacks/metrics_systems/node-exporter.stack.yml node-exporter
docker stack deploy -c ./stacks/metrics_systems/cadvisor.stack.yml cadvisor
docker stack deploy -c ./stacks/metrics_systems/alertmanager.stack.yml alertmanager
docker stack deploy -c ./stacks/metrics_systems/grafana.stack.yml grafana