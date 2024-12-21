FROM php:8.1-fpm

# Installa estensioni e dipendenze necessarie
RUN apt-get update && apt-get install -y \
    libpq-dev \
    zip \
    unzip \
    git \
    curl \
    && docker-php-ext-install pdo_mysql

# Installa Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Imposta la directory di lavoro
WORKDIR /var/www

# Copia i file del progetto
COPY . /var/www

# Fornisci i permessi alla cartella storage e bootstrap/cache
RUN chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Imposta i permessi dell'utente www-data
RUN chown -R www-data:www-data /var/www

# Esponi la porta
EXPOSE 8000

# Comando di avvio
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
