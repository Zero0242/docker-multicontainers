# Pagina oficial
# https://containrrr.dev/watchtower/
# Guia de utilidad
# https://tuadmindesistemas.com/instalar-watchtower-con-docker/
docker run -d \
    --name watchtower \
    -v /var/run/docker.sock:/var/run/docker.sock \
    containrrr/watchtower \
    --interval 300
