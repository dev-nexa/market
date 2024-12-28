#!/bin/bash

echo "$(date): Deployment started" >> /var/www/laravel-lakkta/deploy.log

cd /var/www/laravel-lakkta || { echo "Directory not found!" >> /var/www/laravel-lakkta/deploy.log; exit 1; }

/usr/bin/git pull origin main >> /var/www/laravel-lakkta/deploy.log 2>&1
/usr/bin/php /var/www/laravel-lakkta/artisan migrate --force >> /var/www/laravel-lakkta/deploy.log 2>&1

echo "$(date): Deployment finished" >> /var/www/laravel-lakkta/deploy.log