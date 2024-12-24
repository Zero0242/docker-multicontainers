# Configuracion Oracle Docker

Configuracion para una base de datos oracle en docker

# Azure Data Studio

Programa administrador de base de datos multiplataforma y gratuito, esta disponible en [Github](https://github.com/Microsoft/azuredatastudio).

> Es muy similar a Visual Studio Code

# CloudBeaver

Otra solucion que soporta diferentes bases de datos, puede ser corrida mediante un contenedor de docker o buscar su version de escritorio. [documentacion](https://github.com/dbeaver/cloudbeaver/wiki/Entity-Diagrams)

# Adminer

Otro gestor bien ligero escrito en php, para revisar varias bases de datos. [Docs](https://dev.to/dendihandian/ms-sql-server-and-adminer-in-laradock-5a7a) e imagen [Docker](https://hub.docker.com/_/adminer)

- Temas favoritos:
  - dracula

# Docker Desktop

Herramienta de virtualizacion de base de datos, permite el uso de imagenes de **Linux** con diferentes **servicios** montados en ellos.

> Es requerido para correr imagenes de docker.

## Docker Compose

> La imagen es proporcionada por oracle, esta es la version express de la [imagen](https://container-registry.oracle.com/ords/ocr/ba/database/express)

Esta es la configuracion de docker-compose.yaml para montar rapidamente la base de datos.

Para correr este archivo basta con correr.

1. Crear contenedores `docker-compose up -d`
2. Eliminar contenedores `docker-compose down --volumes`
3. Eliminar la imagen sin usar `docker image prune -a`

```yaml
services:
  oracleDB:
    container_name: oracle_container
    image: container-registry.oracle.com/database/express:18.4.0-xe
    platform: linux/amd64
    # image: oraclelinux:9
    restart: always
    # volumes:
    #  - ./ora_data:/opt/oracle/oradata
    ports:
      - "1521:1521"
      - "5500:5500"
    environment:
      ORACLE_PWD: Oracle#1234
```

## Informacion

1.  Asumiendo que usan la configuracion de arriba, entonces
    - http://localhost:5500/em/
    - Expone el Manager de la edicion express
2.  La data del contenedor es alojada en `/opt/oracle/oradata`
3.  El puerto expuerto para la conexion son
    - 1521 - DB
    - 5500 - MANAGER

## Descarga

1. Para descargar la imagen

```bash
docker pull container-registry.oracle.com/database/express:18.4.0-xe
```
