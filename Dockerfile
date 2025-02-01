FROM php:8.0-apache

# Crear directorio y archivo mascotas.json con permisos adecuados
RUN mkdir -p /var/www/html/img \
    && touch /var/www/html/mascotas.json \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html \
    && chmod 666 /var/www/html/mascotas.json

COPY . /var/www/html/

EXPOSE 80
CMD ["apache2-foreground"]
