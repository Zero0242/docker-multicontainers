docker container run -d \
-p 9000:9000 \
--name portainer \
--restart always \
-v /var/run/docker.sock:/var/run/docker.sock \
portainer/portainer-ce:alpine