# SQL Server

> Estamos usando la imagen oficial de microsoft de [**sql-server**](https://learn.microsoft.com/es-es/sql/linux/quickstart-install-connect-docker?view=sql-server-ver16&tabs=cli&pivots=cs1-bash), disponibles en otras versiones

Esta es la configuracion de docker-compose.yaml para montar rapidamente la base de datos.

Para correr este archivo basta con correr.

1. Crear contenedores `docker-compose up -d`
2. Eliminar contenedores `docker-compose down --volumes`
3. Eliminar la imagen sin usar `docker image prune -a`

```yaml
services:
  db:
    container_name: databaseContainer
    image: mcr.microsoft.com/mssql/server:2022-latest
    restart: always
    # platform: linux/amd64
    volumes:
      - ./sql_server:/var/opt/mssql/data/
    ports:
      - "1433:1433"
    environment:
      MSSQL_SA_PASSWORD: SuperP@ssw00rd
      ACCEPT_EULA: Y
```

### Terminal (Por si no quiere usar el archivo)

Para montar la base de datos mediante **terminal** se recomienda estos pasos

1. Descargar la imagen

```bash
docker pull mcr.microsoft.com/mssql/server:2022-latest
```

2. Montar la imagen
   - Linea 1 correr contnedor
   - Linea 2 expone el puerto 1433 **container** al puerto del pc **host** 1433
   - Linea 3 configurar password del SA admin a **SuperP@ssw00rd**
   - Linea 4 acepta los terminos de condiciones
   - Linea 5 como se va a llamar el dominio del contenedor
   - Linea 6 selecciona la imagen que vamos a correr en modo backgroudn

```bash
docker container run \
    -p 1433:1433 \
    -e MSSQL_SA_PASSWORD:SuperP@ssw00rd \
    -e ACCEPT_EULA:Y \
    --name sqlserver_server \
    mcr.microsoft.com/mssql/server:2022-latest -d
```

---

# Recursos utiles

1. Guia de SQL mediante Docker [acá](https://blog.data-code.io/sqlserver-instalacion-base-de-datos/)
2. Video de conexiones SQL Server con docker [acá](https://youtu.be/uHz9xOiaBbw?si=icGfQ8Vzc8kvAFVu)

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
