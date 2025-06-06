# Base de datos

Template para usar `postgresql` la data es persistida en la carpeta `database/`. Con nombre de servidor `postgres_database`

# Opcion 1: solo base de datos

#### UP

```sh
docker compose up -d
```

#### Down

```sh
docker compose down
```

---

# Opcion 2: Base de datos + PGAdmin

Data de pgadmin es persistida en `pgadmin/`

> alternativamente puede usar `adminer` como panel de base de datos usando `--profile adminer`

#### UP

```sh
docker compose --profile pgadmin up -d
```

#### Down

```sh
docker compose --remove-orphans
```
