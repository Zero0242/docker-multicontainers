# SQL Server

> Estamos usando la imagen oficial de microsoft de [**sql-server**](https://learn.microsoft.com/es-es/sql/linux/quickstart-install-connect-docker?view=sql-server-ver16&tabs=cli&pivots=cs1-bash), disponibles en otras versiones

Esta es la configuracion de docker-compose.yaml para montar rapidamente la base de datos.

#### TAGS:

- `2022-latest` edicion 2022
- `2019-latest` edicion 2019

```bash
# Reemplazar <tag> por un valor de abajo
docker pull mcr.microsoft.com/mssql/server:<tag>
```

#### Azure Data Studio [Descontinuado]

Programa administrador de base de datos multiplataforma y gratuito, esta disponible en [Github](https://github.com/Microsoft/azuredatastudio), es la mejor alternativa para administrar sql-server.

#### Extension de VsCode [Recomendado]

Extensiones general y `ms-sql` para trabajar especificamente con sql server

- [sql tools](https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools)
- [ms-mssql](https://marketplace.visualstudio.com/items?itemName=ms-mssql.mssql)

# Opcion 1: solo base de datos

#### UP

```sh
docker compose up -d
```

#### Down

```sh
docker compose down
```

# Opcion 2: base de datos + adminer

#### UP

```sh
docker compose --profile adminer up -d
```

#### Down

```sh
docker compose --remove-orphans
```

---

# Recursos utiles

1. Guia de SQL mediante Docker [acá](https://blog.data-code.io/sqlserver-instalacion-base-de-datos/)
2. Video de conexiones SQL Server con docker [acá](https://youtu.be/uHz9xOiaBbw?si=icGfQ8Vzc8kvAFVu)
