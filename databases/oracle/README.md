# Configuracion Oracle Docker

Configuracion para una base de datos oracle en docker, documentacion en [oracle](https://docs.oracle.com/en/database/oracle/oracle-database/21/deeck/index.html#GUID-B8FF9621-CA60-46EC-819E-5588514CE761)

- La imagen es proporcionada por oracle, esta es la version express de la [imagen](https://container-registry.oracle.com/ords/ocr/ba/database/express)

#### Azure Data Studio [Descontinuado]

Programa administrador de base de datos multiplataforma y gratuito, esta disponible en [Github](https://github.com/Microsoft/azuredatastudio), es la mejor alternativa para administrar sql-server.

#### Extension de VsCode [Recomendado]

Extensiones general y `ms-sql` para trabajar especificamente con sql server

- [sql tools](https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools)

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
