#!/bin/bash

# Asegurar que el directorio y el archivo existen
mkdir -p /var/www/html/img
touch /var/www/html/mascotas.json

# Asignar permisos correctos al directorio y al archivo JSON
chown -R www-data:www-data /var/www/html
chmod -R 775 /var/www/html/img
chmod 666 /var/www/html/mascotas.json

# Iniciar Apache
exec apache2-foreground
    