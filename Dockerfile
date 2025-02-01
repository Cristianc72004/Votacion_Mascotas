FROM php:8.0-apache

# Crear el directorio de imágenes si no existe
RUN mkdir -p /var/www/html/img

# Otorgar permisos adecuados al directorio
RUN chown -R www-data:www-data /var/www/html/img \
    && chmod -R 777 /var/www/html/img

COPY . /var/www/html/

EXPOSE 80
CMD ["apache2-foreground"]
