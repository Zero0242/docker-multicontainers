# Servidor de Minecraft

Configuración de server de minecraft

```sh
# Levantar servidor
docker compose up -d
# Bajar servidor
docker compose down
```

#### Setup del servidor

Requiere de algunos programas como docker, curl, gpg y git los cuales van en `setup-script.sh`

```sh
# Ejecutar script de instalación
sh setup-script.sh
```

#### Playit gg

Tomar como referencia este [link](https://playit.gg/support/host-247-with-playit) para ver los comandos para crear un tunel

```bash
# Instalacion de playit
sh play-it-setup.sh
```

#### Ejemplo: Forge

```yaml
services:
  minecraft:
    container_name: minecraft
    image: itzg/minecraft-server
    # Información del Juego y Carpeta de Plugins
    volumes:
      - ./data:/data
      - ./mods:/mods
      - ./plugins:/plugins
    ports:
      - 25565:25565
    # Parametros acá; https://docker-minecraft-server.readthedocs.io/en/latest/variables/
    environment:
      EULA: "TRUE"
      TYPE: "FORGE"
      MEMORY: "2G"
      ENABLE_WHITELIST: "FALSE"
      ENFORCE_WHITELIST: "FALSE"
      VERSION: "1.20.1"
      # MODE: "creative"
      ONLINE_MODE: false
      FORGE_VERSION: "47.4.0"
    tty: true
    stdin_open: true
    restart: unless-stopped
```
