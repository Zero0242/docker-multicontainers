# Base de datos

Template para usar `mongodb` la data es persistida en la carpeta `database/`. Con nombre de servidor `mongodb_container`

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

# Opcion 2: Base de datos + Mongo Express

#### UP

```sh
docker compose --profile with_panel up -d
```

#### Down

```sh
docker compose --remove-orphans
```

# Opcion de Mongo con Proteccion

Protegido con usuario y contraseña, el panel requiere estos valores para poder ser usado

```yaml
services:
  database:
    container_name: mongodb_container
    ports:
      - 27017:27017
    image: mongo:6.0
    volumes:
      - ./database:/data/db
    restart: unless-stopped
    command: "--auth"
    environment:
      # * Reemplazar por credenciales .env
      MONGO_INITDB_ROOT_USERNAME: nombre_de_usuario_seguro
      MONGO_INITDB_ROOT_PASSWORD: pass_de_usuario_seguro

  panel:
    profiles:
      - with_panel
    depends_on:
      - database
    container_name: express_panel
    ports:
      - 8080:8081
    image: mongo-express:1.0.0-alpha.4
    restart: unless-stopped
    environment:
      ME_CONFIG_MONGODB_SERVER: mongodb_container
      # * Reemplazar por credenciales .env
      ME_CONFIG_MONGODB_ADMINUSERNAME: nombre_de_usuario_seguro
      ME_CONFIG_MONGODB_ADMINPASSWORD: pass_de_usuario_seguro
```
