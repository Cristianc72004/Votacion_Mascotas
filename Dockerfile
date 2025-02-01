FROM php:8.0-apache

# Crear directorios y establecer permisos adecuados
RUN mkdir -p /var/www/html/img \
    && touch /var/www/html/mascotas.json \
    && chown -R www-data:www-data /var/www/html/img /var/www/html/mascotas.json \
    && chmod -R 777 /var/www/html/img /var/www/html/mascotas.json

COPY . /var/www/html/

EXPOSE 80
CMD ["apache2-foreground"]
