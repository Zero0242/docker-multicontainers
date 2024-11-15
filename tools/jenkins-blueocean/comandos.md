# Instalando Jenkins Via Docker

Esta configuracion fue extraida de esta [pagina](https://www.jenkins.io/doc/book/installing/docker/) y el docker compose fue generado con esta [herramienta](https://www.composerize.com/)

## Requisitos

Vamos a usar la imagen lts de jenkins y docker en docker

```bash
docker pull jenkins/jenkins:lts
docker pull docker:dind
```

## Pasos

1. Creamos el volumen para jenkins y dockers y un network

```bash
docker volume create jenkins-data &&
docker volume create jenkins-docker-certs &&
docker network create jenkins
```

2. Levantar contenedor de docker in docker

```bash
docker container run \
--name jenkins-docker \
--detach \
--privileged \
--network jenkins \
--network-alias docker \
--env DOCKER_TLS_CERTDIR=/certs \
--volume jenkins-docker-certs:/certs/client \
--volume jenkins-data:/var/jenkins_home \
--publish 2376:2376 \
docker:dind
```

3. Levantar contenedor de jenkins

```bash
docker run \
--name jenkins-blueocean \
--restart=on-failure \
--detach \
--network jenkins \
--env DOCKER_HOST=tcp://docker:2376 \
--env DOCKER_CERT_PATH=/certs/client \
--env DOCKER_TLS_VERIFY=1 \
--publish 8080:8080 \
--publish 50000:50000 \
--volume jenkins-data:/var/jenkins_home \
--volume jenkins-docker-certs:/certs/client:ro \
jenkins/jenkins:lts
```
