FROM php:8.0-apache

# Copiar archivos del proyecto
COPY . /var/www/html/

# Copiar el script de permisos
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80

# Usar el script de permisos antes de ejecutar Apache
CMD ["/entrypoint.sh"]
