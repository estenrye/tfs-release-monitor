#!/bin/sh
echo 'traefik'
cat /etc/hosts | grep -qxF '127.0.0.1 traefik.localhost' || echo '127.0.0.1 traefik.localhost' >> /etc/hosts
echo 'jaeger'
cat /etc/hosts | grep -qxF '127.0.0.1 jaeger.localhost' || echo '127.0.0.1 jaeger.localhost' >> /etc/hosts
echo 'redis'
cat /etc/hosts | grep -qxF '127.0.0.1 redis.localhost' || echo '127.0.0.1 redis.localhost' >> /etc/hosts
echo 'prometheus'
cat /etc/hosts | grep -qxF '127.0.0.1 prometheus.localhost' || echo '127.0.0.1 prometheus.localhost' >> /etc/hosts
echo 'grafana'
cat /etc/hosts | grep -qxF '127.0.0.1 grafana.localhost' || echo '127.0.0.1 grafana.localhost' >> /etc/hosts
echo 'cadvisor'
cat /etc/hosts | grep -qxF '127.0.0.1 cadvisor.localhost' || echo '127.0.0.1 cadvisor.localhost' >> /etc/hosts
echo 'alertmanager'
cat /etc/hosts | grep -qxF '127.0.0.1 alertmanager.localhost' || echo '127.0.0.1 alertmanager.localhost' >> /etc/hosts
echo 'graylog'
cat /etc/hosts | grep -qxF '127.0.0.1 graylog.localhost' || echo '127.0.0.1 graylog.localhost' >> /etc/hosts