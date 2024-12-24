# PHP COMPOSER

1. Instalar php mediante apt

   - La version deberia ser la 8.1xxx
   - Bajar `php-curl` y `php-xml`

2. Descargar `composer`

3. Bajar repo

4. Instalar `composer`

## Historial de comandos

## Librerias

```sh
apt install apache2 php php-curl php-xml -y
apt install git unzip nano
```

## Composer

```sh
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
mv composer.phar /usr/local/bin/composer
```

## Git - realizar procedimiento normal del repo

## Dentro de la raiz del repo

```sh
composer install

chown -R www-data:www-data storage bootstrap/cache
chmod -R 775 storage bootstrap/cache

php artisan config:cache
php artisan route:cache
composer dump-autoload --optimize
php artisan key:generate
```

# Configuracion Virtual Host

1. `/etc/init.d/apache2/sites-avaliable/`
   - copiar la configuracion en este directorio
   - correr comandos
   ```sh
     a2ensite custom-api.conf
     a2enmod rewrite
   ```
