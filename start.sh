#!/bin/bash

# Install Composer dependencies
composer install

# Generate application key
php artisan key:generate

# Run database migrations
php artisan migrate

# Install and build frontend assets
npm install
npm run dev

# Start PHP-FPM
php-fpm 