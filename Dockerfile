FROM php:8.2-apache

# Activa mod_rewrite si lo necesitas
RUN a2enmod rewrite

# Instala extensiones PHP comunes (puedes ajustar si tu app usa BD)
RUN docker-php-ext-install pdo pdo_mysql

WORKDIR /var/www/html

# Copia todo tu proyecto dentro del contenedor
COPY . /var/www/html

# Ajusta permisos
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]
