FROM php:8.0-apache

# Crear el directorio img antes de copiar el código
RUN mkdir /var/www/html/img

COPY . /var/www/html/

# Cambiar permisos para permitir la escritura
RUN chmod -R 775 /var/www/html/img

EXPOSE 80
CMD ["apache2-foreground"]
