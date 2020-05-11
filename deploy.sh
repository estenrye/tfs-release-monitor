export TOP_LEVEL_DOMAIN='dev.lab.ryezone.com'
export TRAEFIK_WEB_ENTRYPOINT='web'
export ENABLE_ADMIN_PORT='false'

docker stack deploy -c ./stacks/data_systems/jaeger.stack.yml jaeger
docker stack deploy -c ./stacks/network_systems/traefik.stack.yml -c ./stacks/network_systems/traefik.development.stack.yml  traefik