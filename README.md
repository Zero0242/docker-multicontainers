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

---

<div style="height: 100px;"></div>

## Docker Compose

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

# Recursos utiles

1. Guia de SQL mediante Docker [acá](https://blog.data-code.io/sqlserver-instalacion-base-de-datos/)
2. Video de conexiones SQL Server con docker [acá](https://youtu.be/uHz9xOiaBbw?si=icGfQ8Vzc8kvAFVu)

<div style="height: 100px;"></div>

# PHP COMPOSER

1. Instalar php mediante apt

   - La version deberia ser la 8.1xxx
   - Bajar php-curl y php-xml

2. Descargar composer

3. Bajar repo

4. Instalar composer

## Historial de comandos

## Librerias

apt install apache2 php php-curl php-xml -y
apt install git unzip nano

## Composer

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
mv composer.phar /usr/local/bin/composer

## Git - realizar procedimiento normal del repo

## Dentro de la raiz del repo

composer install

chown -R www-data:www-data storage bootstrap/cache
chmod -R 775 storage bootstrap/cache

php artisan config:cache
php artisan route:cache
composer dump-autoload --optimize
php artisan key:generate

# Configuracion Virtual Host

1. /etc/init.d/apache2/sites-avaliable/
   - copiar la configuracion en este directorio
   - correr comandos
     a2ensite orengy-api.conf
     a2enmod rewrite

---

<div style="height: 100px;"></div>
