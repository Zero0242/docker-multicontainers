#!/bin/bash
# This script sets up Portainer, a lightweight management UI for Docker.
# It pulls the Portainer image and runs it in a Docker container.
docker container run -d \
-p 9000:9000 \
--name portainer \
--restart always \
-v /var/run/docker.sock:/var/run/docker.sock \
portainer/portainer-ce:alpine