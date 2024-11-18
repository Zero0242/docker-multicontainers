# Stack 1

Jenkins con uso de docker local `docker-compose.yaml`

- Preconfiguraciones

```bash
# Configurar Network y volumenes
docker volume create jenkins_home
docker network create jenkins

# Descargar imagenes
# Para Mac M1 o si no les soporta la aquitectura
docker pull --platform linux/amd64 jenkins/jenkins:lts
docker pull --platform linux/amd64 jenkins/agent:alpine-jdk17
docker pull alpine/socat:1.8.0.0

# Montar contenedores
docker compose up -d

# Extraer IP: socket:socat para conexiones con Jenkins
docker inspect socat | grep IPAddress
```

# Stack 2

Configuracion Sencilla `docker-compose.simple.yaml`

```sh
docker compose -f docker-compose.simple.yaml up -d
```
