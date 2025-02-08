# Terraria Server

Configuracion basada en esta imagen de docker (ryshe/terraria)[https://hub.docker.com/r/ryshe/terraria/]

## Levantar

```shell
docker compose up -d
```


# PlayitGG

Para configurar el sharing del servidor por medio de playit.gg, el script de instalación se encuentra en `./playitgg-setup.sh`

- [Instalación en Linux](https://playit.gg/download/linux)
- [Corriendo Playit 24/7](https://playit.gg/support/host-247-with-playit/)


## Servir

```shell
systemctl start playit
```