<p align="center">
  <a href="https://github.com/" target="blank">
  <img src="https://cdn-icons-png.flaticon.com/512/25/25231.png" width="200" alt="App Logo" /></a>
</p>

# Proyecto Contenedores de Docker

Configuraciones de docker que pueden ser utiles

## DEV

## Requisitos

1. Tener instalado docker

## Scripts

Algunos scripts que pueden ser utilizados

| Comando                    | Descripción                    |
| -------------------------- | ------------------------------ |
| `docker build .`           | Construye una imagen de Docker |
| `docker run <imagen>`      | Ejecuta un contenedor          |
| `docker ps`                | Lista los contenedores activos |
| `docker stop <contenedor>` | Detiene un contenedor          |
| `docker rm <contenedor>`   | Elimina un contenedor          |
| `docker rmi <imagen>`      | Elimina una imagen de Docker   |
| `docker pull <imagen>`     | Descarga una imagen de Docker  |

## Puertos Habilitados

> OJO: en la sección `ports` el puerto habilitado en nuestro lado es el del lado izquierdo

Ejemplo de configuración en un archivo `docker-compose.yml` para exponer el puerto 9000 del host al 80 del contenedor Nginx:

```yaml
services:
  nginx:
    image: nginx:latest
    ports:
      - "9000:80"
```

Con esta configuración, puedes acceder a Nginx desde tu navegador en la máquina local usando:

```
http://localhost:9000
```
