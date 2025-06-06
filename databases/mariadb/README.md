# Base de datos

Template para usar `mariasql` la data es persistida en la carpeta `database/`. Con nombre de servidor `mariadb_container`

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

# Opcion 2: Base de datos + PhPMyAdmin

> alternativamente puede usar `adminer` como panel de base de datos usando `--profile adminer`

#### UP

```sh
docker compose --profile phpmyadmin up -d
```

#### Down

```sh
docker compose --remove-orphans
```
